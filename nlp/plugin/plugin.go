package main

import (
	"fmt"
	"io"
	"os"

	"github.com/opencontrol/compliance-masonry/lib"
	"github.com/opencontrol/compliance-masonry/lib/common"
)

type plugin struct {
	common.Workspace
}

func simpleDataExtract(p plugin) string {
	components := p.GetAllComponents()
	if len(components) == 0 {
		return "no data"
	}
	return components[0].GetName()
}

func run(workspacePath, certPath string, writer io.Writer) {
	workspace, _ := lib.LoadData(workspacePath, certPath)
	sampleData := simpleDataExtract(plugin{workspace})
	fmt.Fprintf(writer, sampleData)
}

func main() {
	run(os.Args[1], os.Args[2], os.Stdout)
}
