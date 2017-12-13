# frozen_string_literal: true

module Sesc
  class Exporter
    class Help
      DESCRIPTION = {
        number: 'Quantidade de eventos a serem listados',
        places: 'Unidades do sesc que podem serem filtradas'
      }.freeze


      class << self
        def print
          DESCRIPTION.each do |command, description|
            puts("#{alias_for(command)}#{' ' * 5}#{DESCRIPTION[command]}")
          end
        end

        def puts_header
          puts 'Uso: sesc [opções...]'
          puts ''
          puts 'Opções:'
          puts ''
        end

        def alias_for(command)
          Sesc::Cli::Options::COMMANDS_WITH_OPTIONS[command].join(' ')
        end

        def puts(text)
          Sesc::Exporter::Printer.tabulated(text.to_s)
        end
      end
    end
  end
end
