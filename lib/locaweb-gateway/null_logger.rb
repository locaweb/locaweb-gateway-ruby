module Locaweb
  module Gateway
    # Class responsible to don't log any message.
    #
    class NullLogger
      def info(message)
      end

      def error(message)
      end
    end
  end
end
