require 'rspec'
require_relative '../lib/bob'

RSpec.describe Bob do
  let(:bob) { Bob.new }

  describe '#hey' do
    context 'when the statement is silence' do
      it 'responds with "Fine. Be that way!"' do
        expect(bob.hey('')).to eq('Fine. Be that way!')
      end
    end

    context 'when the statement is a question' do
      it 'responds with "Sure."' do
        expect(bob.hey('How are you?')).to eq('Sure.')
      end
    end

    context 'when the statement is yelling' do
      it 'responds with "Woah, chill out!"' do
        expect(bob.hey('HEY!')).to eq('Woah, chill out!')
      end
    end

    context 'when the statement is neutral' do
      it 'responds with "Whatever."' do
        expect(bob.hey('Hello there.')).to eq('Whatever.')
      end
    end

    context 'when the statement is both a question and yelling' do
      it 'responds with "Woah, chill out!"' do
        expect(bob.hey('WHAT ARE YOU DOING?')).to eq('Woah, chill out!')
      end
    end
  end
end
