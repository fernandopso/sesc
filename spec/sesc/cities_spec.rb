# frozen_string_literal: true

require './lib/sesc/cities'

RSpec.describe Sesc::Cities do
  describe '.include?' do
    context 'when city is included' do
      it { expect(Sesc::Cities.include?('sp')).to be true }
    end

    context 'when city not included' do
      it { expect(Sesc::Cities.include?('mg')).to be false }
    end
  end

  describe '.valids' do
    it 'list valids cities' do
      expect(Sesc::Cities.valids).to eq %w[sp]
    end
  end
end
