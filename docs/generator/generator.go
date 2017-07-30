package main

import (
	"encoding/xml"
	"errors"
	"fmt"
	"html/template"
	"io/ioutil"
	"log"
	"os"
	"path"
	"path/filepath"
	"strings"

	cmcommon "github.com/opencontrol/compliance-masonry/lib/common"
	cmcomponents "github.com/opencontrol/compliance-masonry/lib/components"
)

const componentPath = "./components"
const xmlStandardPath = "./data/800-53-controls.xml"
const tmplPath = "./tmpl/80053.test.tmpl"

// Mount point within container
const markdownOutputPath = "./800-53"

func doesExist(path string) bool {
	if _, err := os.Stat(path); err != nil {
		if os.IsNotExist(err) {
			return false
		}
	}

	return true
}

func parseComponents(rootDir string) ([]cmcommon.Component, error) {
	var components []cmcommon.Component
	var filePaths []string

	componentDirs, _ := ioutil.ReadDir(rootDir)
	for _, root := range componentDirs {
		if err := filepath.Walk(path.Join(rootDir, root.Name()), func(path string, f os.FileInfo, err error) error {
			if err != nil {
				return err
			}
			if f.IsDir() {
				filePaths = append(filePaths, path)
			}
			return nil
		}); err != nil {
			return nil, err
		}
	}

	if len(filePaths) == 0 {
		return nil, errors.New("No component files were parsed")
	}

	for _, file := range filePaths {
		component, err := cmcomponents.Load(file)
		if err != nil {
			return nil, err
		}
		components = append(components, component)
	}

	return components, nil
}

func parseStandard(standardFilePath string) (XMLStandard, error) {
	var standard XMLStandard

	data, err := ioutil.ReadFile(standardFilePath)
	if err != nil {
		return standard, err
	}

	if err := xml.Unmarshal(data, &standard); err != nil {
		return standard, err
	}

	return standard, nil
}

func iterateControls(family string, familyTitle string, controls []XMLControl, components []cmcommon.Component) ([]MarkdownTemplateControl, string) {
	var markdownTemplateControls []MarkdownTemplateControl
	var abbrev string

	for _, control := range controls {
		if control.Family == family && len(control.Withdrawn.IncorporatedInto) <= 0 {
			if abbrev == "" {
				abbrev = strings.Split(control.Number, "-")[0]
			}

			markdownTemplateControl := MarkdownTemplateControl{
				Family:               familyTitle,
				Number:               control.Number,
				Title:                strings.Title(strings.ToLower(control.Title)),
				Statements:           control.Statements,
				IsControlEnhancement: false,
			}

			for _, component := range components {
				satisfies := component.GetAllSatisfies()
				for _, satisfy := range satisfies {
					if satisfy.GetControlKey() == control.Number {
						markdownTemplateControl.Components = append(markdownTemplateControl.Components, MarkdownTemplateComponent{
							Name: component.GetName(),
							ImplementationStatuses: satisfy.GetImplementationStatuses(),
							ControlOrigins:         satisfy.GetControlOrigins()},
						)

						break
					}
				}
			}

			markdownTemplateControls = append(markdownTemplateControls, markdownTemplateControl)

			xmlControlEnhancements := make([]XMLControl, len(control.ControlEnhancements))
			for i, enhancement := range control.ControlEnhancements {
				xmlControlEnhancements[i] = XMLControl{
					Family:         family,
					Number:         enhancement.Number,
					Title:          enhancement.Title,
					BaselineImpact: enhancement.BaselineImpact,
					Withdrawn:      enhancement.Withdrawn,
					Statements:     enhancement.Statements,
				}
			}
			markdownTemplateControlEnhancements, _ := iterateControls(family, familyTitle, xmlControlEnhancements, components)
			markdownTemplateControls = append(markdownTemplateControls, markdownTemplateControlEnhancements...)
		}
	}

	return markdownTemplateControls, abbrev
}

func generateMarkdownFiles(standard XMLStandard, components []cmcommon.Component) error {
	// Get families
	var families []string
	var currentFamily string
	for _, control := range standard.Controls {
		if currentFamily != control.Family {
			families = append(families, control.Family)
			currentFamily = control.Family
		}
	}

	// Generate markdown for each family
	for _, family := range families {
		familyTitle := strings.Title(strings.ToLower(family))

		markdownTemplateControls, abbrev := iterateControls(family, familyTitle, standard.Controls, components)
		markdownTemplateMap := map[string][]MarkdownTemplateControl{
			familyTitle: markdownTemplateControls,
		}

		tmpl, err := template.ParseFiles(tmplPath)
		if err != nil {
			return err
		}

		f, err := os.Create(fmt.Sprintf("./%s/%s.md", markdownOutputPath, abbrev))
		if err != nil {
			return err
		}
		defer f.Close()

		if err := tmpl.Execute(f, markdownTemplateMap); err != nil {
			return err
		}

	}

	return nil
}

func main() {
	if !doesExist(componentPath) {
		log.Fatalf("Component directory path %s does not exist", componentPath)
	} else if !doesExist(xmlStandardPath) {
		log.Fatalf("Standard file path %s does not exist", xmlStandardPath)
	} else if !doesExist(tmplPath) {
		log.Fatalf("Template file path %s does not exist", tmplPath)
	} else if !doesExist(markdownOutputPath) {
		log.Fatalf("Markdown output path %s does not exist", markdownOutputPath)
	}

	standard, err := parseStandard(xmlStandardPath)
	if err != nil {
		log.Fatalf("Error parsing standard: %v", err)
	}

	components, err := parseComponents(componentPath)
	if err != nil {
		log.Fatalf("Error parsing component files: %v", err)
	}

	err = generateMarkdownFiles(standard, components)
	if err != nil {
		log.Fatalf("Error generating markdown files: %v", err)
	}
}
