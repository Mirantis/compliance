package main

import "encoding/xml"

type XMLStandard struct {
	Controls []XMLControl `xml:"control"`
	XMLName  xml.Name     `xml:"http://scap.nist.gov/schema/sp800-53/feed/2.0 controls"`
}

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

type XMLWithdrawn struct {
	IncorporatedInto []string `xml:"incorporated-into"`
}

type XMLStatement struct {
	Number      string         `xml:"number"`
	Description string         `xml:"description"`
	Statements  []XMLStatement `xml:"statement"`
}

type XMLSupplementalGuidance struct {
	Description string   `xml:"description"`
	Related     []string `xml:"related"`
}

type XMLControlEnhancement struct {
	Number         string         `xml:"number"`
	Title          string         `xml:"title"`
	BaselineImpact []string       `xml:"baseline-impact"`
	Withdrawn      XMLWithdrawn   `xml:"withdrawn"`
	Statements     []XMLStatement `xml:"statement"`
}

type XMLReference struct {
	Item string `xml:"item"`
	Link string `xml:"href,attr"`
}

type MarkdownTemplateControl struct {
	Family               string
	Number               string
	Title                string
	Statements           []XMLStatement
	IsControlEnhancement bool
	Components           []MarkdownTemplateComponent
}

type MarkdownTemplateComponent struct {
	Name                   string
	ImplementationStatuses []string
	ControlOrigins         []string
}
