require "../service"

module ShortURL
  module Services
    class TinyURL < Service
      def initialize
        super("tinyurl.com")

        @method = :get
        @action = "/api-create.php"
      end
    end
  end
end
