require 'rspec'
require_relative '../lib/acronyms'

RSpec.describe Acronyms do
  describe '.include?' do
    it 'returns true for known acronyms' do
      expect(Acronyms.include?('NASA')).to be true
    end

    it 'returns false for unknown acronyms' do
      expect(Acronyms.include?('UNKNOWN')).to be false
    end
  end
end
