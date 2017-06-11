class String
  def to_snake
    self.gsub(/([A-Z]+)([A-Z][a-z])/,'\1_\2').gsub(/([a-z\d])([A-Z])/,'\1_\2').downcase
  end

  def to_pascal
    self.split('_').map { |word| word[0].upcase + word[1..-1]}.join
  end
end