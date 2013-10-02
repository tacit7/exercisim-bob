class Statement
  def initialize(statement)
    @statement = statement.gsub('?', ' ?')
  end

  # Returns an array of types based on the given statement.
  #
  # @return [Array] An array of types, which can be one of the following:
  #   - :question: if the statement is a question
  #   - :yelling: if the statement is in all caps
  #   - :silence: if the statement is empty
  #   - :neutral: if the statement is neither a question nor in all caps
  def types
    types = []
    push_if_type = ->(type, method) { types.push(type) if send(method) }
    push_if_type.call(:question, :question?)
    push_if_type.call(:yelling, :yelling?)
    push_if_type.call(:silence, :silence?)
    push_if_type.call(:neutral, :neutral?)
    types
  end

  # Checks if the given statement is a question by delegating to the has_interrogation_mark? method.
  #
  # @return [Boolean] Returns true if the statement is a question, false otherwise.
  def question?
    has_interrogation_mark?
  end

  # Checks if the given statement is in all caps.
  #
  # @return [Boolean] Returns true if the statement is in all caps, false otherwise.
  def yelling?
    all_caps?
  end

  # Checks if the given statement is empty after removing leading and trailing whitespace.
  #
  # @return [Boolean] Returns true if the statement is empty, false otherwise.
  def silence?
    @statement.strip.empty?
  end

  # Checks if the statement is neutral.
  #
  # @return [Boolean] Returns true if the statement is neutral, false otherwise.
  #   A statement is considered neutral if it is not a question, not yelling, and not silent.
  def neutral?
    !silence? && !question? && !yelling?
  end

  private

  # Checks if the given statement ends with a question mark.
  #
  # @return [Boolean] Returns true if the statement ends with a question mark, false otherwise.
  def has_interrogation_mark?
    @statement.end_with?('?')
  end

  # Filters out acronyms from the given statement and checks for all caps.
  #
  # @param statement [String] The statement to filter acronyms from.
  # @return [Boolean] Returns true if the statement is in all uppercase and includes at least one alphabet character, false otherwise.
  def all_caps?
    statement = filter_acronyms(@statement)

    statement == statement.upcase &&
    statement.count('a-zA-Z]') > 0
  end

  # Filters out acronyms from the given statement.
  #
  # @param statement [String] The statement to filter acronyms from.
  # @return [String] The statement with acronyms removed.
  def filter_acronyms(statement)
    split_special_chars(statement).reject { |word| Acronyms.include?(word) }.join(' ')
  end

  # Splits the given statement into an array of words based on special characters.
  #
  # @param statement [String] The statement to be split.
  # @return [Array<String>] An array of words extracted from the statement.
  def split_special_chars(statement)
    statement.split(/[\s.,'?]/)
  end
end
