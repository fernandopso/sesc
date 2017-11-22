# frozen_string_literal: true

RSpec.describe Sesc::Crawler do
  let(:number) { Sesc::Cli::Options::DEFAULT[:number] }
  subject      { described_class.new(number) }

  describe '#get' do
    before(:each) do
      VCR.use_cassette('crawler') do
        @response = subject.get
      end
    end

    it 'return a html string to response' do
      expect(@response.class).to be String
    end
  end
end
