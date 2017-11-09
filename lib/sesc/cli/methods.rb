module Sesc
  class Cli
    module Methods
      def help?
        args.include?('--help') || args.include?('-h')
      end

      def city
        index_to_city ? args[index_to_city + 1] : Sesc::Cities::DEFAULT
      end

      def number_of_events
        index_to_number ? args[index_to_number + 1] : Sesc::Crawler::MAX_RESULTS
      end

      def index_to_city
        args.index('--city') || args.index('-c')
      end

      def index_to_number
        args.index('--number') || args.index('-n')
      end
    end
  end
end
