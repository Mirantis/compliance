require 'spec_helper'

describe Semverse::Version do
  describe "ClassMethods" do
    subject { Semverse::Version }

    describe "::new" do
      context "a string containing a major, minor and patch separated by periods a pre-release and a build" do
        before(:each) { @version = subject.new("1.2.3-rc.1+build.1") }

        it "assigns a major value" do
          expect(@version.major).to eq(1)
        end

        it "assigns a minor value" do
          expect(@version.minor).to eq(2)
        end

        it "assigns a patch value" do
          expect(@version.patch).to eq(3)
        end

        it "assigns a pre_release value" do
          expect(@version.pre_release).to eq('rc.1')
        end

        it "assigns a build value" do
          expect(@version.build).to eq('build.1')
        end
      end

      context "a string containing a major, minor and patch separated by periods and a build" do
        before(:each) { @version = subject.new("1.2.3+pre-build.11.e0f985a") }

        it "assigns a major value" do
          expect(@version.major).to eq(1)
        end

        it "assigns a minor value" do
          expect(@version.minor).to eq(2)
        end

        it "assigns a patch value" do
          expect(@version.patch).to eq(3)
        end

        it "doesn't assigns a pre_release value" do
          expect(@version.pre_release).to be_nil
        end

        it "assigns a build value" do
          expect(@version.build).to eq('pre-build.11.e0f985a')
        end
      end

      context "a string containing a major, minor, and patch separated by periods" do
        before(:each) { @version = subject.new("1.2.3") }

        it "assigns a major value" do
          expect(@version.major).to eq(1)
        end

        it "assigns a minor value" do
          expect(@version.minor).to eq(2)
        end

        it "assigns a patch value" do
          expect(@version.patch).to eq(3)
        end

        it "doesn't assigns a pre_release value" do
          expect(@version.pre_release).to be_nil
        end

        it "doesn't assigns a build value" do
          expect(@version.build).to be_nil
        end
      end

      context "a five element array" do
        before(:each) { @version = subject.new([1,2,3,nil,'build.1']) }

        it "assigns a major value" do
          expect(@version.major).to eq(1)
        end

        it "assigns a minor value" do
          expect(@version.minor).to eq(2)
        end

        it "assigns a patch value" do
          expect(@version.patch).to eq(3)
        end

        it "doesn't assigns a pre_release value" do
          expect(@version.pre_release).to be_nil
        end

        it "assigns a build value" do
          expect(@version.build).to eq('build.1')
        end
      end

      context "a four element array" do
        before(:each) { @version = subject.new([1,2,3,'alpha.1']) }

        it "assigns a major value" do
          expect(@version.major).to eq(1)
        end

        it "assigns a minor value" do
          expect(@version.minor).to eq(2)
        end

        it "assigns a patch value" do
          expect(@version.patch).to eq(3)
        end

        it "assigns a pre_release value" do
          expect(@version.pre_release).to eq('alpha.1')
        end

        it "doesn't assigns a build value" do
          expect(@version.build).to be_nil
        end
      end

      context "a three element array" do
        before(:each) { @version = subject.new([1,2,3]) }

        it "assigns a major value" do
          expect(@version.major).to eq(1)
        end

        it "assigns a minor value" do
          expect(@version.minor).to eq(2)
        end

        it "assigns a patch value" do
          expect(@version.patch).to eq(3)
        end

        it "doesn't assigns a pre_release value" do
          expect(@version.pre_release).to be_nil
        end

        it "doesn't assigns a build value" do
          expect(@version.build).to be_nil
        end
      end

      context "a two element array" do
        before(:each) { @version = subject.new([1,2]) }

        it "assigns a major value" do
          expect(@version.major).to eq(1)
        end

        it "assigns a minor value" do
          expect(@version.minor).to eq(2)
        end

        it "sets the patch value to 0 (zero)" do
          expect(@version.patch).to eq(0)
        end

        it "doesn't assigns a pre_release value" do
          expect(@version.pre_release).to be_nil
        end

        it "doesn't assigns a build value" do
          expect(@version.build).to be_nil
        end
      end

      context "a one element array" do
        before(:each) { @version = subject.new([1]) }

        it "assigns the major value" do
          expect(@version.major).to eq(1)
        end

        it "sets the minor value to 0 (zero)" do
          expect(@version.minor).to eq(0)
        end

        it "sets the patch value to 0 (zero)" do
          expect(@version.patch).to eq(0)
        end

        it "doesn't assigns a pre_release value" do
          expect(@version.pre_release).to be_nil
        end

        it "doesn't assigns a build value" do
          expect(@version.build).to be_nil
        end
      end

      context "an empty array" do
        before(:each) { @version = subject.new(Array.new) }

        it "sets the majro value to 0 (zero)" do
          expect(@version.major).to eq(0)
        end

        it "sets the minor value to 0 (zero)" do
          expect(@version.minor).to eq(0)
        end

        it "sets the patch value to 0 (zero)" do
          expect(@version.patch).to eq(0)
        end

        it "doesn't assigns a pre_release value" do
          expect(@version.pre_release).to be_nil
        end

        it "doesn't assigns a build value" do
          expect(@version.build).to be_nil
        end
      end
    end

    describe "::split" do
      it "returns an array containing 5 elements" do
        expect(subject.split("1.2.0-alpha.1").size).to eq(5)
      end

      context "given a string only containing a major, minor and patch version" do
        it "returns an array containing 4 elements" do
          expect(subject.split("1.2.3").size).to eq(5)
        end

        it "returns nil as fourth element" do
          expect(subject.split("1.2.3")[3]).to be_nil
        end

        it "returns nil as fifth element" do
          expect(subject.split("1.2.3")[4]).to be_nil
        end
      end

      context "given a string only containing a major and minor version" do
        it "returns an array containing 4 elements" do
          expect(subject.split("1.2").size).to eq(3)
        end

        it "returns 0 as the third element" do
          expect(subject.split("1.2")[2]).to eq(0)
        end

        it "converts the third element to 0 if it's nil or blank" do
          expect(subject.split("1.2.")[2]).to eq(0)
        end
      end

      context "given a string with only a major version" do
        it "returns an array containing 3 elements" do
          expect(subject.split("1").size).to eq(3)
        end

        it "returns 0 as the second element" do
          expect(subject.split("1")[1]).to eq(0)
        end

        it "returns 0 as the third element" do
          expect(subject.split("1")[2]).to eq(0)
        end

        it "converts the second element to 0 if it's nil or blank" do
          expect(subject.split("1.")[1]).to eq(0)
        end
      end

    context "given a string with an invalid version"
      it "raises an InvalidVersionFormat error" do
        expect {
          subject.split("hello")
        }.to raise_error(Semverse::InvalidVersionFormat)
      end
    end

    describe "::coerce" do

      it "coerces a String to a Version object" do
        expect(subject.coerce("1.0.0")).to eql(subject.new("1.0.0"))
      end

      it "returns an object of the desired class without any additional processing" do
        version = subject.new("1.0.0")
        # we want object equality here to prove that the exact object was returned
        expect(subject.coerce(version)).to equal(version)
      end

    end

  end

  describe "#pre_release?" do
    context "when a pre-release value is set" do
      subject { described_class.new("1.2.3-alpha").pre_release? }
      it { should be true }
    end

    context "when no pre-release value is set" do
      subject { described_class.new("1.2.3").pre_release? }
      it { should be false }
    end
  end

  describe "#zero?" do
    context "major, minor and patch are equal to 0" do
      subject { described_class.new("0.0.0").zero? }
      it { should be true }
    end

    context "major is not equal to 0" do
      subject { described_class.new("1.0.0").zero? }
      it { should be false }
    end

    context "minor is not equal to 0" do
      subject { described_class.new("0.1.0").zero? }
      it { should be false }
    end

    context "patch is not equal to 0" do
      subject { described_class.new("0.0.1").zero? }
      it { should be false }
    end
  end

  describe "#to_s" do
    subject { Semverse::Version.new("1.0.0-rc.1+build.1") }

    it "returns a string containing the major.minor.patch-pre_release+build" do
      expect(subject.to_s).to eq("1.0.0-rc.1+build.1")
    end
  end

  describe "#<=>" do
    it "compares versions" do
      versions_list = %w[
        1.0.0-0
        1.0.0-alpha
        1.0.0-alpha.1
        1.0.0-beta.2
        1.0.0-beta.11
        1.0.0-rc.1
        1.0.0-rc.1+build.1
        1.0.0
        1.0.0+0.3.7
        1.0.0+build
        1.0.0+build.2.b8f12d7
        1.0.0+build.11.e0f985a
      ]
      versions = versions_list.map { |version| Semverse::Version.new(version) }

      100.times do
        shuffled_versions = versions.shuffle
        while shuffled_versions == versions
          shuffled_versions = shuffled_versions.shuffle
        end
        expect(shuffled_versions.sort.map(&:to_s)).to eq(versions_list)
      end
    end
  end

end
