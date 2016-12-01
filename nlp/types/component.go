package types

// Component holds the properties that make up an OpenControl component
type Component struct {
	DocumentationComplete bool        `yaml:"documentation_complete"`
	SchemaVersion         string      `yaml:"schema_version"`
	Name                  string      `yaml:"name"`
	References            []Reference `yaml:"references"`
	Satisfies             []Control   `yaml:"satisfies"`
}

// Reference holds the properties that make up the references attribute of an OpenControl component
type Reference struct {
	Name string `yaml:"name"`
	Path string `yaml:"path"`
	Type string `yaml:"type"`
}

// Control holds the properties that which determine an OpenControl component's satisfaction of the control
type Control struct {
	ControlKey             string      `yaml:"control_key"`
	CoveredBy              []string    `yaml:"covered_by"`
	ImplementationStatuses []string    `yaml:"implementation_statuses"`
	ControlOrigins         []string    `yaml:"control_origins"`
	Narrative              []Narrative `yaml:"narrative"`
	StandardKey            string      `yaml:"standard_key"`
}

// Narrative holds the description of the component and a matching subpart defined by the control
type Narrative struct {
	ID   string
	Key  string `yaml:"key"`
	Text string `yaml:"text"`
}
