require "spec_helper"
require "conceptual/entity_builder"

RSpec.describe Conceptual::EntityBuilder do
  context "when it is initialized" do
    subject { Conceptual::EntityBuilder.new }

    it "has empty attributes array" do
      expect(subject.attributes).to be_empty
    end
  end

  context "after method `int` called" do
    subject(:entity_builder) {
      eb = Conceptual::EntityBuilder.new
      eb.int(:age)
      eb
    }

    describe("attributes") do
      subject { entity_builder.attributes }

      it "has 1 element" do
        expect(subject.size).to eq 1
      end

      it "contains :age" do
        expect(subject).to include(:age)
      end

    end
  end

end
