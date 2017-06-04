require "spec_helper"
require "conceptual/entity_builder"

RSpec.describe Conceptual::EntityBuilder do
  subject(:entity_builder) { Conceptual::EntityBuilder.new }

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
        expect(subject).to include(:age)
      end

    end

    context "after method `string` called" do
      let!(:action) { entity_builder.string(:name) }

      it "has 1 element" do
        expect(subject.size).to eq 1
      end

      it "contains :age" do
        expect(subject).to include(:name)
      end

    end
  end

end
