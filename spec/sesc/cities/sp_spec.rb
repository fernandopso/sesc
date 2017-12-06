# frozen_string_literal: true

RSpec.describe Sesc::Cities::Sp do
  describe '#print_on_terminal' do
    let(:result) do
      %i[
        url image_url availability category title date
        hours place description age_limit price
      ]
    end

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
