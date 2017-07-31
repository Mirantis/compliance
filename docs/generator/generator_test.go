package main

import (
	"encoding/xml"
	"reflect"
	"testing"
)

func Test_doesExist(t *testing.T) {
	type args struct {
		path string
	}
	tests := []struct {
		name string
		args args
		want bool
	}{
		{"exsts", args{"./data/800-53-controls.xml"}, true},
		{"doesNotExist", args{"./data/800-53-controls.xml1"}, false},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			if got := doesExist(tt.args.path); got != tt.want {
				t.Errorf("doesExist() = %v, want %v", got, tt.want)
			}
		})
	}
}

func Test_parseStandard(t *testing.T) {
	type args struct {
		data []byte
	}

	xmlStandard := XMLStandard{
		Controls: []XMLControl{
			{
				Family:         "ACCESS CONTROL",
				Number:         "AC-1",
				Title:          "ACCESS CONTROL POLICY AND PROCEDURES",
				Priority:       "P1",
				BaselineImpact: []string{"LOW", "MODERATE", "HIGH"},
			},
		},
		XMLName: xml.Name{
			Space: "http://scap.nist.gov/schema/sp800-53/feed/2.0",
			Local: "controls",
		},
	}

	sampleXML := `
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<controls:controls xmlns="http://scap.nist.gov/schema/sp800-53/2.0"
    xmlns:controls="http://scap.nist.gov/schema/sp800-53/feed/2.0"
    xmlns:xhtml="http://www.w3.org/1999/xhtml" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    pub_date="2015-02-03T10:11:18.645-05:00"
    xsi:schemaLocation="http://scap.nist.gov/schema/sp800-53/feed/2.0 http://scap.nist.gov/schema/sp800-53/feed/2.0/sp800-53-feed_2.0.xsd">
    <controls:control>
        <family>ACCESS CONTROL</family>
        <number>AC-1</number>
        <title>ACCESS CONTROL POLICY AND PROCEDURES</title>
        <priority>P1</priority>
        <baseline-impact>LOW</baseline-impact>
        <baseline-impact>MODERATE</baseline-impact>
        <baseline-impact>HIGH</baseline-impact>
    </controls:control>
</controls:controls>
`

	tests := []struct {
		name    string
		args    args
		want    XMLStandard
		wantErr bool
	}{
		{"parseStandard", args{[]byte(sampleXML)}, xmlStandard, false},
		{"missingStandardfile", args{}, XMLStandard{}, true},
		{"nonXMLStandard", args{[]byte("fake")}, XMLStandard{}, true},
	}

	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			got, err := parseStandard(tt.args.data)
			if (err != nil) != tt.wantErr {
				t.Errorf("parseStandard() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if !reflect.DeepEqual(got, tt.want) {
				t.Errorf("parseStandard() = %v, want %v", got, tt.want)
			}
		})
	}
}

func Test_readFile(t *testing.T) {
	type args struct {
		filePath string
	}
	tests := []struct {
		name    string
		args    args
		wantErr bool
	}{
		{"readFile", args{"./data/800-53-controls.xml"}, false},
		{"errorReadingFile", args{}, true},
	}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {
			_, err := readFile(tt.args.filePath)
			if (err != nil) != tt.wantErr {
				t.Errorf("readFile() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
		})
	}
}
