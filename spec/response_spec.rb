require 'rspec'
require_relative '../lib/response'

RSpec.describe Response do
  describe '.to' do
    it 'returns the correct response for silence' do
      expect(Response.to(:silence)).to eq('Fine. Be that way!')
    end

    it 'returns the correct response for a question' do
      expect(Response.to(:question)).to eq('Sure.')
    end

    it 'returns the correct response for yelling' do
      expect(Response.to(:yelling)).to eq('Woah, chill out!')
    end

    it 'returns the correct response for neutral' do
      expect(Response.to(:neutral)).to eq('Whatever.')
    end
  end
end
