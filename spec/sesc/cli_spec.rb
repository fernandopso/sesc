# frozen_string_literal: true

RSpec.describe Sesc::Cli do
  let(:result) { build(:response).to_h.keys }

  describe '.call' do
    subject { @events.values.flatten.first.keys }

    context 'when city exists' do
      context '--city' do
        before(:each) do
          VCR.use_cassette('cli/--city') do
            @events = Sesc::Cli.new(['--city', 'sp']).call
          end
        end

        it { expect(subject).to eq result }
      end

      context '-c' do
        before(:each) do
          VCR.use_cassette('cli/-c') do
            @events = Sesc::Cli.new(['--c', 'sp']).call
          end
        end

        it { expect(subject).to eq result }
      end
    end

    context 'when city dont exists' do
      context '--city' do
        before(:each) { @events = Sesc::Cli.new(['--city', 'mg']).call }

        it { expect(@events).to eq nil }
      end

      context '-c' do
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

    context 'when pass some options' do
      let(:options) { ['--city', 'mg', '-c', 'sp', '--number', 5, '-n', 1] }
      before(:each) do
        VCR.use_cassette('cli/--city--number-n') do
          @events = Sesc::Cli.new(options).call
        end
      end

      it { expect(subject).to eq result }
    end
  end

  describe 'place attribute' do
    let(:places) { Sesc::Cli.new(options).call }

    context 'when send --places' do
      let(:options) { ['--places'] }

      it { expect(places.values.flatten.first.keys).to eq result }
    end

    context 'when send -p' do
      let(:options) { ['-p'] }

      it { expect(places.values.flatten.first.keys).to eq result }
    end
  end
end
