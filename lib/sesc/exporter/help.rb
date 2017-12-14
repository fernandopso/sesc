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
          header
          help
          DESCRIPTION.each do |command, description|
            puts("#{alias_for(command)}#{space_for(alias_for(command))}#{DESCRIPTION[command]}")
          end
        end

        def header
          puts 'Uso: sesc [opções...]'
          puts ''
          puts 'Opções:'
          puts ''
        end

        def help
          puts "-h --help#{space_for('-h --help')}Exibe este texto de ajuda"
        end

        def alias_for(command)
          Sesc::Cli::Options::COMMANDS_WITH_OPTIONS[command].join(' ')
        end

        def space_for(text)
          ' ' * (15 - text.length)
        end

        def puts(text)
          Sesc::Exporter::Printer.tabulated(text.to_s)
        end
      end
    end
  end
end
