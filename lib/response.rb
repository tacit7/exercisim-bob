
class Response
  RESPONSES = {
    silence:  'Fine. Be that way!',
    question: 'Sure.',
    yelling:  'Woah, chill out!',
    neutral:  'Whatever.'
  }

  # Returns the corresponding response for the given statement.
  #
  # @param statement [Symbol] The type of statement.
  # @return [String] The response for the given statement.
  def self.to(statement)
    RESPONSES[statement]
  end
end
