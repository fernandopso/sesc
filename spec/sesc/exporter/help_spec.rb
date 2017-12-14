# frozen_string_literal: true

RSpec.describe Sesc::Exporter::Help do
  context '.print' do
    it 'print help' do
      expect(Sesc::Exporter::Help.print).to be true
    end
  end
end
