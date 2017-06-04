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


end
