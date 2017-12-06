# frozen_string_literal: true

RSpec.describe Sesc do
  describe '.sp' do
    let(:result) { build(:response).to_h.keys }

    context 'when call sp with number value' do
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
