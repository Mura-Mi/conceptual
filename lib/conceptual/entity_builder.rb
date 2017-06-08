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
      append Conceptual::IntAttribute.new(name)
    end

    def string(name)
      append Conceptual::StringAttribute.new(name)
    end

    def date(name)
      append Conceptual::DateAttribute.new(name)
    end

    def datetime(name)
      append Conceptual::DateTimeAttribute.new(name)
    end

    def belongs_to(entity)
      append Conceptual::BelongsToAttribute.new(entity)
    end

    def name
      self.class.name
    end

    def attributes
      @attributes ||= []
    end

    private
    def append(attr)
      attributes << attr
      attr
    end

  end
end
