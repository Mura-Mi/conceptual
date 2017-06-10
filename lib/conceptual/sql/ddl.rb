require 'conceptual/attributes'

module Conceptual

  module Ddl

    def self.build(entity)
      ddl = "CREATE TABLE `#{entity.name}` ("

      separator = ''
      entity.attributes.map { |attr|
        ddl += separator
        ddl += '\n'
        ddl += '  '
        ddl += attr.name
        ddl += ' '
        ddl += 'int'
      }

      ddl + ')'
    end

    private
    def self.datatype(attr)
      if attr is_a? Conceptual::IntAttribute
        'INT(11)'
      elsif attr is_a? Conceptual::StringAttribute
        'VARCHAR(255)'
      elsif attr is_a? Conceptual::DateAttribute
        # TODO
      end
    end

  end

end