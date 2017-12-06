# frozen_string_literal: true

RSpec.describe Sesc::Cities::Sp do
  describe '#print_on_terminal' do
    let(:result) { build(:response).to_h.keys }

    before(:each) do
      VCR.use_cassette('cities/sp') do
        @html_response = Sesc::Crawler.new(1, '').get
      end
    end

    let(:events) { described_class.new(@html_response).print_on_terminal }

    it 'return a array of events' do
      expect(events.values.flatten.first.keys).to eq result
    end
  end
end
