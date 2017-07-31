package main

import "encoding/xml"

// XMLStandard defines the NIST 800-53 XML root
type XMLStandard struct {
	Controls []XMLControl `xml:"control"`
	XMLName  xml.Name     `xml:"http://scap.nist.gov/schema/sp800-53/feed/2.0 controls"`
}

// XMLControl defines the NIST 800-53 control
type XMLControl struct {
	Family               string                    `xml:"family"`
	Number               string                    `xml:"number"`
	Title                string                    `xml:"title"`
	Priority             string                    `xml:"priority"`
	BaselineImpact       []string                  `xml:"baseline-impact"`
	Statements           []XMLStatement            `xml:"statement"`
	SupplementalGuidance []XMLSupplementalGuidance `xml:"supplemental-guidance"`
	ControlEnhancements  []XMLControlEnhancement   `xml:"control-enhancements>control-enhancement"`
	References           []XMLReference            `xml:"references"`
	Withdrawn            XMLWithdrawn              `xml:"withdrawn"`
}

// XMLWithdrawn defines the withdrawn type
type XMLWithdrawn struct {
	IncorporatedInto []string `xml:"incorporated-into"`
}

// XMLStatement defines the statement type
type XMLStatement struct {
	Number      string         `xml:"number"`
	Description string         `xml:"description"`
	Statements  []XMLStatement `xml:"statement"`
}

// XMLSupplementalGuidance defines the supplemental guidance type
type XMLSupplementalGuidance struct {
	Description string   `xml:"description"`
	Related     []string `xml:"related"`
}

// XMLControlEnhancement defines the control enhancement type
type XMLControlEnhancement struct {
	Number         string         `xml:"number"`
	Title          string         `xml:"title"`
	BaselineImpact []string       `xml:"baseline-impact"`
	Withdrawn      XMLWithdrawn   `xml:"withdrawn"`
	Statements     []XMLStatement `xml:"statement"`
}

// XMLReference defines the reference type
type XMLReference struct {
	Item string `xml:"item"`
	Link string `xml:"href,attr"`
}

// MarkdownTemplateControl defines the markdown template file control type
type MarkdownTemplateControl struct {
	Family               string
	Number               string
	Title                string
	Statements           []XMLStatement
	IsControlEnhancement bool
	Components           []MarkdownTemplateComponent
}

// MarkdownTemplateComponent defines the markdown template file component type
type MarkdownTemplateComponent struct {
	ID                     string
	Name                   string
	ImplementationStatuses []string
	ControlOrigins         []string
	Narratives             []string
	NarrativeLinks         []string
}
