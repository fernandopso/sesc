# frozen_string_literal: true

RSpec.describe Sesc do
  describe '.sp' do
    context 'when call sp with value' do
      let(:result) do
        %i[
          url image_url availability category title date
          hours place description age_limit price
        ]
      end

      before(:each) do
        VCR.use_cassette('sp') do
          @events = Sesc.sp(1)
        end
      end

      it 'collect events with keys' do
        expect(@events.values.flatten.first.keys).to eq result
      end
    end
  end
end
