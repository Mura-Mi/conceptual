module Conceptual
  class EntityBuilder
    attr_reader :attributes

    def initialize()
      @attributes = []
    end

    def int(name)
      @attributes << name
    end

    def string(name)
      @attributes << name
    end

    def date(name)
      @attributes << name
    end

    def datetime(name)
      @attributes << name
    end
  end
end
