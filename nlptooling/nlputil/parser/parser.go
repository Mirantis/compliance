package parser

import (
	"errors"
	"io/ioutil"
	"net/http"
	"os"
	"path"
	"path/filepath"
	"strings"

	"github.com/docker/compliance/nlptooling/nlputil/types"
	"github.com/mitchellh/mapstructure"
	uuid "github.com/satori/go.uuid"
	"gopkg.in/yaml.v2"
)

// NIST80053StandardURL ...
const NIST80053StandardURL = "https://raw.githubusercontent.com/opencontrol/NIST-800-53-Standards/master/NIST-800-53.yaml"

// ParseNISTStandard parses the NIST standard yml at the url defined by
// the NIST80053StandardURL constnat
func ParseNISTStandard() (types.NIST80053Standard, error) {
	return parseStandard(NIST80053StandardURL)
}

// ParseNISTStandardWithURL parses the NIST standard yml at the url
// provided by the function caller
func ParseNISTStandardWithURL(url string) (types.NIST80053Standard, error) {
	return parseStandard(url)
}

func parseStandard(url string) (types.NIST80053Standard, error) {
	var standard types.Standard
	var nist80053Standard types.NIST80053Standard

	resp, err := http.Get(url)
	if err != nil {
		return nist80053Standard, err
	}
	defer resp.Body.Close()

	file, err := ioutil.ReadAll(resp.Body)
	if err != nil {
		return nist80053Standard, err
	}

	if len(file) <= 0 {
		return nist80053Standard, errors.New("Error downloading NIST-800-53.yaml")
	}

	if err := yaml.Unmarshal(file, &standard); err != nil {
		return nist80053Standard, err
	}

	nist80053Standard = types.NIST80053Standard{}
	for k, v := range standard {
		// Ignore "name" field and assign ID
		if k != "name" {
			var controlProperties types.ControlProperties
			if err := mapstructure.Decode(v, &controlProperties); err != nil {
				return nist80053Standard, err
			}

			controlProperties.ID = strings.Replace(uuid.NewV4().String(), "-", "", -1)
			nist80053Standard[k] = controlProperties
		}
	}
	return nist80053Standard, nil
}

// ParseComponents ...
func ParseComponents(rootDir string) ([]types.Component, error) {
	var components []types.Component
	var files []string

	componentDirs, _ := ioutil.ReadDir(rootDir)
	for _, root := range componentDirs {
		if err := filepath.Walk(path.Join(rootDir, root.Name()), func(path string, f os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if !f.IsDir() && f.Name() == "component.yaml" {
				files = append(files, path)
			}
			return nil
		}); err != nil {
			return nil, err
		}
	}

	for _, file := range files {
		data, err := ioutil.ReadFile(file)
		if err != nil {
			return nil, err
		}

		var component types.Component
		if err := yaml.Unmarshal(data, &component); err != nil {
			return nil, err
		}

		for i, satisfy := range component.Satisfies {
			for k := range satisfy.Narrative {
				component.Satisfies[i].Narrative[k].ID = strings.Replace(uuid.NewV4().String(), "-", "", -1)
			}
		}

		components = append(components, component)
	}

	return components, nil
}
