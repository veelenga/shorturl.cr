require "../service"

module ShortURL
  module Services
    class Isgd < Service
      def initialize
        super("is.gd")

        @method = :get
        @action = "/api.php"
        @param = "longurl"
      end
    end
  end
end
