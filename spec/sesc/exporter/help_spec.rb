# frozen_string_literal: true

RSpec.describe Sesc::Exporter::Help do
  context '.print' do
    it 'print help' do
      expect(Sesc::Exporter::Help.print).to eq(
        {
          number: 'Quantidade de eventos a serem listados',
          places: 'Unidades do sesc que podem serem filtradas'
        }
      )
    end
  end
end
