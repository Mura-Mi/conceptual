module Conceptual
  class Attribute
    attr_accessor :name

    def initialize(name)
      @name = name
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
