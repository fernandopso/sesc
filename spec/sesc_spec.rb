# frozen_string_literal: true

RSpec.describe Sesc do
  describe '.sp' do
    context 'when call sp with number value' do
      let(:result) do
        %i[
          url image_url availability category title date
          hours place description age_limit price
        ]
      end

      before(:each) do
        VCR.use_cassette('sp') do
          @events = Sesc.sp(1, '')
        end
      end

      it 'collect events with keys' do
        expect(@events.values.flatten.first.keys).to eq result
      end
    end

    context 'when call sp with places value' do
      let(:result) do
        %i[
          url image_url availability category title date
          hours place description age_limit price
        ]
      end

      before(:each) do
        VCR.use_cassette('sp/places') do
          @events = Sesc.sp(5, '1,2')
        end
      end

      it 'collect events with keys' do
        expect(@events.values.flatten.first.keys).to eq result
      end

      it 'filter places' do
        expect(@events.keys).to eq ['SESC 24 de Maio', 'SESC Belenzinho']
      end
    end
  end
end
