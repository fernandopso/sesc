# frozen_string_literal: true

RSpec.describe Sesc::Cities::Sp do
  describe '#print_on_terminal' do
    before(:each) do
      VCR.use_cassette('cities/sp') do
        @html_response = Sesc::Crawler.new(1).get
      end
    end

    let(:events) { described_class.new(@html_response).print_on_terminal }

    it 'return a array of events' do
      expect(events['SESC Vila Mariana'].first.keys).to eq %i(
        url
        image_url
        availability
        category
        title
        date
        hours
        place
        description
        age_limit
        price
      )
    end
  end
end
