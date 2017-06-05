require "spec_helper"
require "conceptual"
require 'singleton'

RSpec.describe Conceptual do
  it "has a version number" do
    expect(Conceptual::VERSION).to eq('0.0.1')
  end

  describe "usage" do

    class Player < Conceptual::EntityBuilder
      include Singleton

      int(:age)
      string(:name)
      date(:birthday)
      datetime(:created_at)
    end

    subject(:player) { Player.instance }

    describe "attributes" do
      subject { player.attributes }

      it "returns all attributes via `attributes`" do
        expect(subject.size).to eq(4)
      end

      it "contains `age` int field as first element" do
        expect(subject[0]).to eq(Conceptual::IntAttribute.new(:age))
      end

      it "contains `name` string field as second element" do
        expect(subject[1]).to eq(Conceptual::StringAttribute.new(:name))
      end

      it "contains `birthday` date field as second element" do
        expect(subject[2]).to eq(Conceptual::DateAttribute.new(:birthday))
      end

      it "contains `created_at` datetime field as second element" do
        expect(subject[3]).to eq(Conceptual::DateTimeAttribute.new(:created_at))
      end

    end

  end

end
