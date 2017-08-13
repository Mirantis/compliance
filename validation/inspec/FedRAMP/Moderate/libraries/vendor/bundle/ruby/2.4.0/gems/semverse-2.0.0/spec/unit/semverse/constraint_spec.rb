require 'spec_helper'

RSpec::Matchers.define :satisfies do |*args|
  match do |constraint|
    expect(constraint.satisfies?(*args)).to be true
  end
end

describe Semverse::Constraint do
  let(:valid_string) { ">= 0.0.0" }
  let(:invalid_string) { "x23u7089213.*" }

  describe "ClassMethods" do
    subject { Semverse::Constraint }

    describe "::new" do
      it "returns a new instance of Constraint" do
        expect(subject.new(valid_string)).to be_a(Semverse::Constraint)
      end

      it "assigns the parsed operator to the operator attribute" do
        expect(subject.new(valid_string).operator).to eq(">=")
      end

      it "assigns the parsed operator to the operator attribute with no separation between operator and version" do
        expect(subject.new(">=0.0.0").operator).to eq(">=")
      end

      it "assigns the parsed version string as an instance of Version to the version attribute" do
        result = subject.new(valid_string)

        expect(result.version).to be_a(Semverse::Version)
        expect(result.version.to_s).to eq("0.0.0")
      end

      it "falls back to a default constraint if nil is provided" do
        result = subject.new(nil)

        expect(result.version.to_s).to eq("0.0.0")
        expect(result.operator).to eq(">=")
      end

      it "fall sback to a default constraint if a blank string is provided" do
        result = subject.new("")

        expect(result.version.to_s).to eq("0.0.0")
        expect(result.operator).to eq(">=")
      end

      context "given a string that does not match the Constraint REGEXP" do
        it "raises an InvalidConstraintFormat error" do
          expect {
            subject.new(invalid_string)
          }.to raise_error(Semverse::InvalidConstraintFormat)
        end
      end

      context "given a constraint that does not include a minor version (~>)" do
        it "has a nil value for minor" do
          expect(subject.new("~> 1").minor).to be_nil
        end

        it "has a nil value for patch" do
          expect(subject.new("~> 1").patch).to be_nil
        end
      end

      context "given a constraint that does not include a minor version (=)" do
        it "has a 0 for minor" do
          expect(subject.new("= 1").minor).to eq(0)
        end
      end

      context "given a constraint that does not include a patch version (~>)" do
        it "has a nil value for patch" do
          expect(subject.new("~> 1.2").patch).to be_nil
        end
      end

      context "given a constraint that does not include a patch version (=)" do
        it "has a 0 for patch" do
          expect(subject.new("= 1.2").patch).to eq(0)
        end
      end

      context "given a constraint that does not include a build version" do
        it "has a nil value for build" do
          expect(subject.new(">= 1.2.3-alpha").build).to be_nil
        end
      end

      context "given a constraint that does not include a pre release version" do
        it "has a nil value for pre release" do
          expect(subject.new(">= 1.2.3+build").pre_release).to be_nil
        end
      end
    end

    describe "::split" do
      let(:constraint_string) { nil }

      subject { described_class.split(constraint_string) }

      context "given a constraint containing the elements (operator, major, minor, patch, pre_release, build)" do
        let(:constraint_string) { ">= 1.2.3-alpha+build" }

        it "returns an array with the constraint operator at index 0" do
          expect(subject[0]).to eq(">=")
        end

        it "returns an array with the major version in index 1" do
          expect(subject[1]).to eq(1)
        end

        it "returns an array with the minor version at index 2" do
          expect(subject[2]).to eq(2)
        end

        it "returns an array with the patch version at index 3" do
          expect(subject[3]).to eq(3)
        end

        it "returns an array with the pre release version at index 4" do
          expect(subject[4]).to eq("alpha")
        end

        it "returns an array with the build version at index 5" do
          expect(subject[5]).to eq("build")
        end
      end

      context "given a constraint containing the elements (operator, major, minor, patch, pre_release)" do
        let(:constraint_string) { ">= 1.2.3-alpha" }

        it "returns an array with the constraint operator at index 0" do
          expect(subject[0]).to eq(">=")
        end

        it "returns an array with the major version in index 1" do
          expect(subject[1]).to eq(1)
        end

        it "returns an array with the minor version at index 2" do
          expect(subject[2]).to eq(2)
        end

        it "returns an array with the patch version at index 3" do
          expect(subject[3]).to eq(3)
        end

        it "returns an array with the pre release version at index 4" do
          expect(subject[4]).to eq("alpha")
        end

        it "returns an array with a nil value at index 5" do
          expect(subject[5]).to be_nil
        end
      end

      context "given a constraint containing the elements (operator, major, minor, patch)" do
        let(:constraint_string) { ">= 1.2.3" }

        it "returns an array with the constraint operator at index 0" do
          expect(subject[0]).to eq(">=")
        end

        it "returns an array with the major version in index 1" do
          expect(subject[1]).to eq(1)
        end

        it "returns an array with the minor version at index 2" do
          expect(subject[2]).to eq(2)
        end

        it "returns an array with the patch version at index 3" do
          expect(subject[3]).to eq(3)
        end

        it "returns an array with a nil value at index 4" do
          expect(subject[4]).to be_nil
        end

        it "returns an array with a nil value at index 5" do
          expect(subject[5]).to be_nil
        end
      end

      context "given a constraint containing the elements (operator, major, minor)" do
        let(:constraint_string) { ">= 1.2" }

        it "returns an array with the constraint operator at index 0" do
          expect(subject[0]).to eq(">=")
        end

        it "returns an array with the major version in index 1" do
          expect(subject[1]).to eq(1)
        end

        it "returns an array with the minor version at index 2" do
          expect(subject[2]).to eq(2)
        end

        it "returns an array with a nil value at index 3" do
          expect(subject[3]).to be_nil
        end

        it "returns an array with a nil value at index 4" do
          expect(subject[4]).to be_nil
        end

        it "returns an array with a nil value at index 5" do
          expect(subject[5]).to be_nil
        end
      end

      context "given a constraint containing the elements (operator, major)" do
        let(:constraint_string) { ">= 1" }

        it "returns an array with the constraint operator at index 0" do
          expect(subject[0]).to eq(">=")
        end

        it "returns an array with the major version in index 1" do
          expect(subject[1]).to eq(1)
        end

        it "returns an array with a nil value at index 2" do
          expect(subject[2]).to be_nil
        end

        it "returns an array with a nil value at index 3" do
          expect(subject[3]).to be_nil
        end

        it "returns an array with a nil value at index 4" do
          expect(subject[4]).to be_nil
        end

        it "returns an array with a nil value at index 5" do
          expect(subject[5]).to be_nil
        end
      end

      context "given a constraint which is missing an operator" do
        let(:constraint_string) { "1.2.3" }

        it "returns an equality operator at index 0" do
          expect(subject[0]).to eq("=")
        end
      end

      context "given a string that does not match the Constraint REGEXP" do
        let(:constraint_string) { "x23u7089213.*" }

        it "raises an InvalidConstraintFormat error" do
          expect {
            subject.split(invalid_string)
          }.to raise_error(Semverse::InvalidConstraintFormat)
        end
      end

      context "given a string that does not contain an operator" do
        let(:constraint_string) { "1.2.3" }

        it "returns a constraint constraint with a default operator (=)" do
          expect(subject[0]).to eq("=")
        end
      end
    end
  end

  describe "#satisfies?" do
    subject { Semverse::Constraint.new("= 1.0.0") }

    it { should satisfies("1.0.0") }
    it { should satisfies(Semverse::Version.new("1.0.0")) }

    context "strictly greater than (>) pre-release constraint" do
      subject { Semverse::Constraint.new("> 1.0.0-alpha") }

      it { should_not satisfies("0.9.9+build") }
      it { should_not satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "strictly greater than (>)" do
      subject { Semverse::Constraint.new("> 1.0.0") }

      it { should_not satisfies("0.9.9+build") }
      it { should_not satisfies("1.0.0-alpha") }
      it { should_not satisfies("1.0.0-alpha.2") }
      it { should_not satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "strictly greater than (>) build constraint" do
      subject { Semverse::Constraint.new("> 1.0.0+build") }

      it { should_not satisfies("0.9.9+build") }
      it { should_not satisfies("1.0.0-alpha") }
      it { should_not satisfies("1.0.0-alpha.2") }
      it { should_not satisfies("1.0.0") }
      it { should_not satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "greater than or equal to (>) zero pre-release constraint" do
      subject { Semverse::Constraint.new("> 0.0.0-alpha") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "greater than or equal to (>) zero constraint" do
      subject { Semverse::Constraint.new("> 0.0.0") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "greater than or equal to (>) zero build constraint" do
      subject { Semverse::Constraint.new("> 0.0.0+build") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "strictly less than (<) pre-release constraint" do
      subject { Semverse::Constraint.new("< 1.0.0-alpha.3") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should_not satisfies("1.0.0") }
      it { should_not satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should_not satisfies("1.0.1") }
      it { should_not satisfies("1.0.1+build.2") }
      it { should_not satisfies("2.0.0") }
    end

    context "strictly less than (<)" do
      subject { Semverse::Constraint.new("< 1.0.0") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should_not satisfies("1.0.0") }
      it { should_not satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should_not satisfies("1.0.1") }
      it { should_not satisfies("1.0.1+build.2") }
      it { should_not satisfies("2.0.0") }
    end

    context "strictly less than (<) build constraint" do
      subject { Semverse::Constraint.new("< 1.0.0+build.20") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should_not satisfies("1.0.1") }
      it { should_not satisfies("1.0.1+build.2") }
      it { should_not satisfies("2.0.0") }
    end

    context "strictly equal to (=)" do
      subject { Semverse::Constraint.new("= 1.0.0") }

      it { should_not satisfies("0.9.9+build") }
      it { should satisfies("1.0.0") }
      it { should_not satisfies("1.0.1") }
      it { should_not satisfies("1.0.0-alpha") }
    end

    context "greater than or equal to (>=) pre-release constraint" do
      subject { Semverse::Constraint.new(">= 1.0.0-alpha") }

      it { should_not satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "greater than or equal to (>=)" do
      subject { Semverse::Constraint.new(">= 1.0.0") }

      it { should_not satisfies("0.9.9+build") }
      it { should_not satisfies("1.0.0-alpha") }
      it { should_not satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "greater than or equal to (>=) build constraint" do
      subject { Semverse::Constraint.new(">= 1.0.0+build") }

      it { should_not satisfies("0.9.9+build") }
      it { should_not satisfies("1.0.0-alpha") }
      it { should_not satisfies("1.0.0-alpha.2") }
      it { should_not satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "greater than or equal to (>=) zero pre-release constraint" do
      subject { Semverse::Constraint.new(">= 0.0.0-alpha") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "greater than or equal to (>=) zero constraint" do
      subject { Semverse::Constraint.new(">= 0.0.0") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "greater than or equal to (>=) zero build constraint" do
      subject { Semverse::Constraint.new(">= 0.0.0+build") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should satisfies("1.0.1-beta") }
      it { should satisfies("1.0.1") }
      it { should satisfies("1.0.1+build.2") }
      it { should satisfies("2.0.0") }
    end

    context "lower than or equal to (<=) pre-release constraint" do
      subject { Semverse::Constraint.new("<= 1.0.0") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should_not satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should_not satisfies("1.0.1") }
      it { should_not satisfies("1.0.1+build.2") }
      it { should_not satisfies("2.0.0") }
    end

    context "lower than or equal to (<=)" do
      subject { Semverse::Constraint.new("<= 1.0.0-alpha") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should_not satisfies("1.0.0-alpha.2") }
      it { should_not satisfies("1.0.0") }
      it { should_not satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should_not satisfies("1.0.1") }
      it { should_not satisfies("1.0.1+build.2") }
      it { should_not satisfies("2.0.0") }
    end

    context "lower than or equal to (<=) build constraint" do
      subject { Semverse::Constraint.new("<= 1.0.0+build") }

      it { should satisfies("0.9.9+build") }
      it { should satisfies("1.0.0-alpha") }
      it { should satisfies("1.0.0-alpha.2") }
      it { should satisfies("1.0.0") }
      it { should satisfies("1.0.0+build") }
      it { should_not satisfies("1.0.1-beta") }
      it { should_not satisfies("1.0.1") }
      it { should_not satisfies("1.0.1+build.2") }
      it { should_not satisfies("2.0.0") }
    end

    %w[~> ~].each do |operator|
      describe "aproximately (#{operator})" do
        context "when the last value in the constraint is for minor" do
          subject { Semverse::Constraint.new("#{operator} 1.2") }

          it { should_not satisfies("1.1.0") }
          it { should_not satisfies("1.2.0-alpha") }
          it { should satisfies("1.2.0") }
          it { should satisfies("1.2.3") }
          it { should satisfies("1.2.3+build") }
          it { should satisfies("1.3") }
          it { should satisfies("1.3.0") }
          it { should_not satisfies("2.0.0-0") }
          it { should_not satisfies("2.0.0") }
        end

        context "when the last value in the constraint is for patch" do
          subject { Semverse::Constraint.new("#{operator} 1.2.0") }

          it { should_not satisfies("1.1.0") }
          it { should_not satisfies("1.2.3-alpha") }
          it { should satisfies("1.2.2") }
          it { should satisfies("1.2.3") }
          it { should satisfies("1.2.5+build") }
          it { should_not satisfies("1.3.0-0") }
          it { should_not satisfies("1.3.0") }
        end

        context "when the last value in the constraint is for pre_release with a last numeric identifier" do
          subject { Semverse::Constraint.new("#{operator} 1.2.3-4") }

          it { should_not satisfies("1.2.3") }
          it { should satisfies("1.2.3-4") }
          it { should satisfies("1.2.3-10") }
          it { should satisfies("1.2.3-10.5+build.33") }
          it { should_not satisfies("1.2.3--") }
          it { should_not satisfies("1.2.3-alpha") }
          it { should_not satisfies("1.2.3") }
          it { should_not satisfies("1.2.4") }
          it { should_not satisfies("1.3.0") }
        end

        context "when the last value in the constraint is for pre_release with a last non-numeric identifier" do
          subject { Semverse::Constraint.new("#{operator} 1.2.3-alpha") }

          it { should_not satisfies("1.2.3-4") }
          it { should_not satisfies("1.2.3--") }
          it { should satisfies("1.2.3-alpha") }
          it { should satisfies("1.2.3-alpha.0") }
          it { should satisfies("1.2.3-beta") }
          it { should satisfies("1.2.3-omega") }
          it { should satisfies("1.2.3-omega.4") }
          it { should_not satisfies("1.2.3") }
          it { should_not satisfies("1.3.0") }
        end

        context "when the last value in the constraint is for build with a last numeric identifier and a pre-release" do
          subject { Semverse::Constraint.new("#{operator} 1.2.3-alpha+5") }

          it { should_not satisfies("1.2.3-alpha") }
          it { should_not satisfies("1.2.3-alpha.4") }
          it { should_not satisfies("1.2.3-alpha.4+4") }
          it { should satisfies("1.2.3-alpha+5") }
          it { should satisfies("1.2.3-alpha+5.5") }
          it { should satisfies("1.2.3-alpha+10") }
          it { should_not satisfies("1.2.3-alpha+-") }
          it { should_not satisfies("1.2.3-alpha+build") }
          it { should_not satisfies("1.2.3-beta") }
          it { should_not satisfies("1.2.3") }
          it { should_not satisfies("1.3.0") }
        end

        context "when the last value in the constraint is for build with a last non-numeric identifier and a pre-release" do
          subject { Semverse::Constraint.new("#{operator} 1.2.3-alpha+build") }

          it { should_not satisfies("1.2.3-alpha") }
          it { should_not satisfies("1.2.3-alpha.4") }
          it { should_not satisfies("1.2.3-alpha.4+4") }
          it { should satisfies("1.2.3-alpha+build") }
          it { should satisfies("1.2.3-alpha+build.5") }
          it { should satisfies("1.2.3-alpha+preview") }
          it { should satisfies("1.2.3-alpha+zzz") }
          it { should_not satisfies("1.2.3-alphb") }
          it { should_not satisfies("1.2.3-beta") }
          it { should_not satisfies("1.2.3") }
          it { should_not satisfies("1.3.0") }
        end

        context "when the last value in the constraint is for build with a last numeric identifier" do
          subject { Semverse::Constraint.new("#{operator} 1.2.3+5") }

          it { should_not satisfies("1.2.3") }
          it { should_not satisfies("1.2.3-alpha") }
          it { should_not satisfies("1.2.3+4") }
          it { should satisfies("1.2.3+5") }
          it { should satisfies("1.2.3+99") }
          it { should_not satisfies("1.2.3+5.build") }
          it { should_not satisfies("1.2.3+-") }
          it { should_not satisfies("1.2.3+build") }
          it { should_not satisfies("1.2.4") }
          it { should_not satisfies("1.3.0") }
        end

        context "when the last value in the constraint is for build with a last non-numeric identifier" do
          subject { Semverse::Constraint.new("#{operator} 1.2.3+build") }

          it { should_not satisfies("1.2.3-alpha") }
          it { should_not satisfies("1.2.3") }
          it { should_not satisfies("1.2.3+5") }
          it { should satisfies("1.2.3+build") }
          it { should satisfies("1.2.3+build.5") }
          it { should satisfies("1.2.3+preview") }
          it { should satisfies("1.2.3+zzz") }
          it { should_not satisfies("1.2.4-0") }
          it { should_not satisfies("1.2.4") }
          it { should_not satisfies("1.2.5") }
          it { should_not satisfies("1.3.0") }
        end
      end
    end
  end

  describe "#==" do
    subject { Semverse::Constraint.new("= 1.0.0") }

    it "returns true if the other object is a Semverse::Constraint with the same operator and version" do
      other = Semverse::Constraint.new("= 1.0.0")
      expect(subject).to eq(other)
    end

    it "returns false if the other object is a Semverse::Constraint with the same operator and different version" do
      other = Semverse::Constraint.new("= 9.9.9")
      expect(subject).to_not eq(other)
    end

    it "returns false if the other object is a Semverse::Constraint with the same version and different operator" do
      other = Semverse::Constraint.new("> 1.0.0")
      expect(subject).to_not eq(other)
    end

    it "returns false if the other object is not a Semverse::Constraint" do
      other = "chicken"
      expect(subject).to_not eq(other)
    end
  end

  describe "#to_s" do
    let(:constraint_string) { ">= 1.2.3-alpha+123" }
    subject { described_class.new(constraint_string).to_s }

    it { should eq(constraint_string) }

    context "when the constraint does not contain a minor or patch value" do
      let(:constraint_string) { "~> 1" }
      it { should eq(constraint_string) }
    end

    context "when the constraint does not contain a patch value" do
      let(:constraint_string) { "~> 1.2" }
      it { should eq(constraint_string) }
    end

    context "when the constraint does not contain a build value" do
      let(:constraint_string) { ">= 1.2.0-alpha"}
      it { should eq(constraint_string) }
    end

    context "when the constraint contains a pre_release value" do
      let(:constraint_string) { ">= 1.2.0+123"}
      it { should eq(constraint_string) }
    end
  end
end
