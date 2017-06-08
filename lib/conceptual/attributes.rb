module Conceptual
  class Attribute
    attr_accessor :name

    def initialize(name)
      @name = name
    end

    def ==(obj)
      obj.class == self.class && obj.name.to_s == self.name.to_s
    end
  end

  class StringAttribute < Attribute

  end

  class IntAttribute < Attribute
  
  end

  class DateAttribute < Attribute
  end

  class DateTimeAttribute < Attribute
  end

  class BelongsToAttribute < Attribute
    def initialize(entity)
      if entity.is_a?(Class) && entity.superclass == Conceptual::EntityBuilder
        @reference = entity
        @name = entity.name
      else
        raise InvalidBelongsToError
      end
    end
  end

  class InvalidBelongsToError < Exception
    def message
      'BelongsToAttributes should be initialized with EntityBuilder class object'
    end
  end
end
