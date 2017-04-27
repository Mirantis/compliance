package parser_test

import (
	. "github.com/docker/compliance/nlptooling/nlputil/parser"
	. "github.com/docker/compliance/nlptooling/nlputil/types"

	. "github.com/onsi/ginkgo"
	. "github.com/onsi/gomega"
)

var _ = Describe("Parser", func() {

	Describe("Executing parse operation on NIST 800-53 standard", func() {
		Context("With yml file at default URL", func() {
			It("Should parse the properties of each control key", func() {
				standard, _ := ParseNISTStandard()
				for _, v := range standard {
					Expect(v).To(BeAssignableToTypeOf(ControlProperties{}))
				}
			})
		})

		Context("With yml file at user-defined URL", func() {
			It("Should parse the properties of each control key", func() {
				url := "https://raw.githubusercontent.com/opencontrol/NIST-800-53-Standards/master/NIST-800-53.yaml"
				standard, _ := ParseNISTStandardWithURL(url)
				for _, v := range standard {
					Expect(v).To(BeAssignableToTypeOf(ControlProperties{}))
				}
			})
		})

		Context("With incorrectly formatted NIST 800-53 standard yml file at user-defined URL", func() {
			It("Should return an error", func() {
				url := "https://gist.githubusercontent.com/anweiss/75b942fea3bc74e5c77fa303c8e0d220/raw/b4a67ac5da3fba8bbcca1f79b236ba47fcddeedd/badnist80053.yml"
				_, err := ParseNISTStandardWithURL(url)
				Expect(err).To(HaveOccurred())
			})
		})

		Context("With file at bad url", func() {
			It("Should return an error", func() {
				url := "https://yml.yml.yml"
				_, err := ParseNISTStandardWithURL(url)
				Expect(err).To(HaveOccurred())
			})
		})
	})

	Describe("Executing parse operation on components", func() {
		Context("With a component.yml file", func() {
			It("Should parse into a component type", func() {
				components, _ := ParseComponents("../../opencontrols/components")
				for _, component := range components {
					Expect(component).To(BeAssignableToTypeOf(Component{}))
				}
			})
		})

		Context("With a non-existent file", func() {
			It("Should return nil", func() {
				path := "./fakefile"
				components, _ := ParseComponents(path)
				Expect(components).To(BeNil())
			})
		})
	})

})
