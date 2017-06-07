require 'conceptual/attributes'

module Conceptual
  class EntityBuilderIsNotSingletonError < Exception
  end

  class EntityBuilder
    attr_reader :attributes

    def initialize()
    end

    def self.method_missing(name, *args)
      if self.respond_to?(:instance)
        self.instance.send name, *args
      else
        raise EntityBuilderIsNotSingletonError
      end
    end

    def int(name)
      attributes << Conceptual::IntAttribute.new(name)
    end

    def string(name)
      attributes << Conceptual::StringAttribute.new(name)
    end

    def date(name)
      attributes << Conceptual::DateAttribute.new(name)
    end

    def datetime(name)
      attributes << Conceptual::DateTimeAttribute.new(name)
    end

    def name
      self.class.name
    end

    def attributes
      @attributes ||= []
    end
  end
end
