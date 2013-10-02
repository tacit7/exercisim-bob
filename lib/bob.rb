require 'statement'
require 'response'
require 'acronyms'
class Bob
  RESPONSES = [:silence, :question, :yelling, :neutral]

  # Returns the appropriate response based on the count and types of the response.
  #
  # @return [Response] The response object.
  def hey(statement)
    @statement = statement
    bobs_response
  end

  private

  # Returns an array of types based on the given statement.
  #
  # @return [Array] An array of types, which can be one of the following:
  #   - :question: if the statement is a question
  #   - :yelling: if the statement is in all caps
  #   - :silence: if the statement is empty
  #   - :neutral: if the statement is neither a question nor in all caps
  def response_types
    @response_types ||= Statement.new(@statement).types
  end

  # Returns the count of response types.
  #
  # @return [Integer] The count of response types.
  def count
    response_types.count
  end

  # Returns the appropriate response based on the count and types of the response.
  #
  # @return [Response] The response object.
  def bobs_response
    if count == 1
      Response.to(response_types.first)
    elsif count == 2 && types_include?(:question, :yelling)
      Response.to(:yelling)
    end
  end

  # Checks if all the arguments are included in the RESPONSES array.
  #
  # @param args [Array] The arguments to check.
  # @return [Boolean] True if all the arguments are included in the RESPONSES array, false otherwise.
  def types_include?(*args)
    args.all? { |arg| RESPONSES.include?(arg) }
  end
end
