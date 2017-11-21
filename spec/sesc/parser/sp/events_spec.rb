# frozen_string_literal: true

RSpec.describe Sesc::Parser::Sp::Events do
  describe '#events' do
    before(:each) do
      VCR.use_cassette('parser/body') do
        @html = Sesc::Crawler.new(1).get
      end
    end

    let(:events) { described_class.new(@html).to_hash }

    it 'return an Nokogiri element' do
      expect(events.keys).to eq ['SESC Vila Mariana']
    end
  end
end
