# frozen_string_literal: true

RSpec.describe Sesc::Parser::Sp::Body do
  describe '#events' do
    before(:each) do
      VCR.use_cassette('parser/body') do
        @html = Sesc::Crawler.new(1).get
      end
    end

    let(:events) { described_class.new(@html).events }

    it 'return an Nokogiri element' do
      expect(events.first.class).to be Nokogiri::XML::Element
    end
  end
end
