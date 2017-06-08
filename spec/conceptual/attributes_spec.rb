require "spec_helper"
require "conceptual/entity_builder"
require "conceptual/attributes"
require 'singleton'

RSpec.describe Conceptual::Attribute do

  class Player < Conceptual::EntityBuilder
    include Singleton
    int(:age)
    string(:name)
    date(:birthday)
    datetime(:created_at)
  end

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

  describe("BelongsToAttribute") do
    it("throws error if it is initialized without EntityBuilder") do
      expect { Conceptual::BelongsToAttribute.new("invalid") }.to raise_error Conceptual::InvalidBelongsToError
    end

    it("throws error if initialize arg is class but not EntityBuilder") do
      expect { Conceptual::BelongsToAttribute.new(String) }.to raise_error Conceptual::InvalidBelongsToError
    end

    subject { Conceptual::BelongsToAttribute.new(Player) }

    it("can be initialized with EntityBuilder") do
      expect { subject }.to_not raise_error
    end

    it('builds default attribute name from given associated entity') {
      expect(subject.name).to eq 'player'
    }
  end

end
