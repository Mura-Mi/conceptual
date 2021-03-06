require "spec_helper"
require "conceptual"
require 'singleton'

RSpec.describe Conceptual do
  it "has a version number" do
    expect(Conceptual::VERSION).to eq('0.0.1')
  end

  describe 'EntityBuilder without Singleton module' do
    it 'throws error message' do
      expect {
        class InvalidPlayer < Conceptual::EntityBuilder
          int(:age)
          string(:name)
          date(:birthday)
          datetime(:created_at)
        end
      }.to raise_error(Conceptual::EntityBuilderIsNotSingletonError)
    end
  end

  describe 'belongsTo with class which is not EntityBuilder' do
    it 'throws error message' do
      expect {
        class InvalidPlayer < Conceptual::EntityBuilder
          include Singleton
          int(:age)
          string(:name)
          belongs_to(String)
        end
      }.to raise_error(Conceptual::InvalidBelongsToError)
    end
  end

  describe "usage" do

    class Team < Conceptual::EntityBuilder
      include Singleton

      string(:name)
      int(:since_year)
    end

    class HighSchool < Conceptual::EntityBuilder
      include Singleton
    end

    class Player < Conceptual::EntityBuilder
      include Singleton

      int(:age)
      string(:name)
      belongs_to(Team)
      belongs_to(HighSchool).as(:graduated_high_school)
      date(:birthday)
      datetime(:created_at)
    end

    subject(:player) { Player.instance }

    describe "attributes" do
      subject { player.attributes }

      it "returns all attributes via `attributes`" do
        expect(subject.size).to eq(6)
      end

      it "contains `age` int field as first element" do
        expect(subject[0]).to eq(Conceptual::IntAttribute.new(:age))
      end

      it "contains `name` string field as second element" do
        expect(subject[1]).to eq(Conceptual::StringAttribute.new(:name))
      end

      it "contains `team` belongs_to field as third element" do
        expect(subject[2]).to eq(Conceptual::BelongsToAttribute.new(Team))
      end

      it "contains `graduated_high_school`" do
        expect(subject[3]).to be_a Conceptual::BelongsToAttribute
      end
      it "graduated_high_school is HighSchool" do
        expect(subject[3].reference).to eq HighSchool
      end
      it "is named as graduated_high_school" do
        expect(subject[3].name).to eq :graduated_high_school
      end

      it "contains `birthday` date field as fourth element" do
        expect(subject[4]).to eq(Conceptual::DateAttribute.new(:birthday))
      end

      it "contains `created_at` datetime field as fifth element" do
        expect(subject[5]).to eq(Conceptual::DateTimeAttribute.new(:created_at))
      end

    end

  end

end
