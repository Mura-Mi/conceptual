require "spec_helper"
require "conceptual/entity_builder"

RSpec.describe Conceptual::EntityBuilder do
  subject(:entity_builder) { Conceptual::EntityBuilder.new }

  describe("name") do
    class Player < Conceptual::EntityBuilder
    end

    subject { Player.instance.name }

    it { is_expected.to eq("Player") }
  end

  describe("attributes") do
    subject { entity_builder.attributes }

    context "when it is initialized" do
      let!(:action) {}

      it "has empty attributes array" do
        expect(entity_builder.attributes).to be_empty
      end
    end

    context "after method `int` called" do
      let!(:action) { entity_builder.int(:age) }

      it "has 1 element" do
        expect(subject.size).to eq 1
      end

      it "contains :age" do
        expect(subject).to include(Conceptual::IntAttribute.new(:age))
      end
    end

    context "after method `string` called" do
      let!(:action) { entity_builder.string(:name) }

      it "has 1 element" do
        expect(subject.size).to eq 1
      end

      it "contains :age" do
        expect(subject).to include(Conceptual::StringAttribute.new(:name))
      end
    end

    context "after method `date` called" do
      let!(:action) { entity_builder.date(:birthday) }

      it "has 1 element" do
        expect(subject.size).to eq 1
      end

      it "contains :age" do
        expect(subject).to include(Conceptual::DateAttribute.new(:birthday))
      end
    end

    context "after method `datetime` called" do
      let!(:action) { entity_builder.datetime(:created_at) }

      it "has 1 element" do
        expect(subject.size).to eq 1
      end

      it "contains :age" do
        expect(subject).to include(Conceptual::DateTimeAttribute.new(:created_at))
      end
    end
  end

end
