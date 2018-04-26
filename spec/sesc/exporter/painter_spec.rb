# frozen_string_literal: true

RSpec.describe Sesc::Exporter::Painter do
  let(:text) { 'sesc' }

  subject { described_class.new(text).default }

  context '.default' do
    it 'set default color' do
      expect(subject).to eq "\e[0;97;40msesc\e[0m"
    end
  end
end
