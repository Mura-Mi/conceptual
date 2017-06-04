require "spec_helper"
require "conceptual/attributes"

RSpec.describe Conceptual::Attribute do
  describe("StringAttribute") do
    subject(:attr) { Conceptual::StringAttribute.new(:name) }

    describe(:name) do
      subject { attr.name }

      it "is as initializer receives" do
        expect(subject).to eq(:name) 
      end
    end
  end

  describe("IntAttribute") do
    subject(:attr) { Conceptual::IntAttribute.new(:age) }

    describe(:name) do
      subject { attr.name }

      it "is as initializer receives" do
        expect(subject).to eq(:age)
      end
    end
  end

  describe("DateAttribute") do
    subject(:attr) { Conceptual::DateAttribute.new(:birthday) }

    describe(:name) do
      subject { attr.name }

      it "is as initializer receives" do
        expect(subject).to eq(:birthday)
      end
    end
  end

  describe("DatetimeAttribute") do
    subject(:attr) { Conceptual::DateTimeAttribute.new(:created_at) }

    describe(:name) do
      subject { attr.name }

      it "is as initializer receives" do
        expect(subject).to eq(:created_at)
      end
    end
  end

end
