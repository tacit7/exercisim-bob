require 'rspec'
require_relative '../lib/statement'

RSpec.describe Statement do
  let(:statement) { Statement.new('How are you?') }

  describe '#types' do
    it 'identifies a question' do
      expect(statement.types).to include(:question)
    end

    it 'identifies yelling' do
      statement = Statement.new('HEY!')
      expect(statement.types).to include(:yelling)
    end

    it 'identifies silence' do
      statement = Statement.new('')
      expect(statement.types).to include(:silence)
    end

    it 'identifies neutral' do
      statement = Statement.new('Hello there.')
      expect(statement.types).to include(:neutral)
    end
  end

  describe '#question?' do
    it 'returns true for a question' do
      expect(statement.question?).to be true
    end

    it 'returns false for a non-question' do
      statement = Statement.new('Hello there.')
      expect(statement.question?).to be false
    end
  end

  describe '#yelling?' do
    it 'returns true for yelling' do
      statement = Statement.new('HEY!')
      expect(statement.yelling?).to be true
    end

    it 'returns false for normal speech' do
      statement = Statement.new('Hello there.')
      expect(statement.yelling?).to be false
    end
  end

  describe '#silence?' do
    it 'returns true for silence' do
      statement = Statement.new('')
      expect(statement.silence?).to be true
    end

    it 'returns false for non-silence' do
      expect(statement.silence?).to be false
    end
  end

  describe '#neutral?' do
    it 'returns true for neutral statements' do
      statement = Statement.new('Hello there.')
      expect(statement.neutral?).to be true
    end

    it 'returns false for non-neutral statements' do
      expect(statement.neutral?).to be false
    end
  end
end
