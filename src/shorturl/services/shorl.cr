require "../service"

module ShortURL
  module Services
    class Shorl < Service
      def initialize
        super("shorl.com")

        @method = :get
        @action = "/create.php"
      end

      def on_body(body)
        matched = body.scan(/http:\/\/shorl\.com\/[\w]+/)
        return matched[0][0] if matched && !matched.empty?
      end
    end
  end
end
