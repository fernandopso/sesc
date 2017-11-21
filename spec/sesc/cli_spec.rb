# frozen_string_literal: true

RSpec.describe Sesc::Cli do
  let(:result) { %i[url image_url availability category title date hours place description age_limit price] }

  describe '.call' do
    context 'when city exists' do
      context '--city' do
        before(:each) do
          VCR.use_cassette('cli/--city') do
            @events = Sesc::Cli.new(['--city', 'sp']).call
          end
        end

        it { expect(@events['SESC Vila Mariana'].first.keys).to eq result }
      end

      context '--c' do
        before(:each) do
          VCR.use_cassette('cli/-c') do
            @events = Sesc::Cli.new(['--c', 'sp']).call
          end
        end

        it { expect(@events['SESC Vila Mariana'].first.keys).to eq result }
      end
    end

    context 'when city dont exists' do
      context '--city' do
        before(:each) { @events = Sesc::Cli.new(['--city', 'mg']).call }

        it { expect(@events).to eq nil }
      end

      context '--c' do
        before(:each) { @events = Sesc::Cli.new(['-c', 'mg']).call }

        it { expect(@events).to eq nil }
      end
    end

    context 'when pass number of events' do
      context '--number' do
        before(:each) do
          VCR.use_cassette('cli/--number') do
            @events = Sesc::Cli.new(['--number', '3']).call
          end
        end

        it { expect(@events.values.flatten.count).to eq 3 }
      end
    end
  end
end