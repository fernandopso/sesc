# frozen_string_literal: true

module Sesc
  class Cli
    module Options
      DEFAULT = { city: 'sp', number: 5 }.freeze

      COMMANDS_WITH_OPTIONS = {
        city:   ['-c', '--city'],
        number: ['-n', '--number']
      }.freeze

      COMMANDS_WITH_OPTIONS.each do |command, options|
        define_method(command) do
          index_for(options) ? args[index_for(options) + 1] : DEFAULT[command]
        end
      end

      def help?
        args.include?('-h') || args.include?('--help')
      end

      def index_for(values)
        values.each { |v| return args.index(v) if args.index(v) }
        nil
      end
    end
  end
end
