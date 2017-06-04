require 'conceptual/attributes'

module Conceptual
  class EntityBuilder
    attr_reader :attributes

    def initialize()
      @attributes = []
    end

    def int(name)
      @attributes << Conceptual::IntAttribute.new(name)
    end

    def string(name)
      @attributes << Conceptual::StringAttribute.new(name)
    end

    def date(name)
      @attributes << Conceptual::DateAttribute.new(name)
    end

    def datetime(name)
      @attributes << Conceptual::DateTimeAttribute.new(name)
    end
  end
end
