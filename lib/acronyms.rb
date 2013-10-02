class Acronyms
  LIST = %w(DMV NASA NASCAR FBI CIA)

  # Checks if the given statement is included in the LIST.
  #
  # @param statement [Object] The statement to be checked.
  # @return [Boolean] Returns true if the statement is included in the LIST, false otherwise.
  def self.include?(statement)
    LIST.include?(statement)
  end
end
