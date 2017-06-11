require 'conceptual/attributes'

module Conceptual

  module Sql

    def self.ddl(entity)
      ddl = "CREATE TABLE `#{entity.name}` ("

      separator = ''
      entity.attributes.map { |attr|
        ddl += separator
        ddl += "\n"
        ddl += '  '
        ddl += attr.name.to_s
        ddl += ' '
        ddl += datatype(attr)
        separator = ','
      }

      ddl + "\n)"
    end

    private
    def self.datatype(attr)
      if attr.is_a? Conceptual::IntAttribute
        'INT(11)'
      elsif attr.is_a? Conceptual::StringAttribute
        'VARCHAR(255)'
      elsif attr.is_a? Conceptual::DateAttribute
        'DATE'
      elsif attr.is_a? Conceptual::DateTimeAttribute
        'DATETIME'
      end
    end

  end

end