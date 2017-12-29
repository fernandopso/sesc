# frozen_string_literal: true

module Sesc
  class Exporter
    class Help
      DESCRIPTION = {
        number: 'Quantidade de eventos a serem listados',
        places: 'Unidades do sesc que podem serem filtradas'
      }.freeze

      FILTERS = {
        places: 'Listar todos os SESC'
      }.freeze

      class << self
        def print
          header
          options
          help
          descriptions
          filters
          true
        end

        def descriptions
          DESCRIPTION.each do |command, description|
            text = alias_for(command)
            puts("#{text}#{space_for(text)}#{description}")
          end
        end

        def options
          puts ''
          puts 'Opções:'
          puts ''
        end

        def header
          puts 'Uso: sesc [filtros...] [opções...]'
        end

        def help
          puts "-h --help#{space_for('-h --help')}Exibe este texto de ajuda"
        end

        def filters
          puts ''
          puts 'Filtros:'
          puts ''

          FILTERS.each do |command, description|
            puts("#{command}#{space_for(command)}#{description}")
          end
        end

        def alias_for(command)
          Sesc::Cli::Options::COMMANDS_WITH_OPTIONS[command].join(' ')
        end

        def space_for(text)
          ' ' * (15 - text.length)
        end

        def puts(text)
          Sesc::Exporter::Printer.new(text.to_s).tabulated
        end
      end
    end
  end
end
