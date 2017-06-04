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
end
