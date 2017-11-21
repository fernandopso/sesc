# frozen_string_literal: true

RSpec.describe Sesc::Crawler do
  subject { described_class.new }

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
