# frozen_string_literal: true

RSpec.describe Sesc::Exporter::Places do
  context '.print' do
    it 'print all places' do
      expect(Sesc::Exporter::Places.print.flatten(2).count).to eq 40
    end
  end
end
