require "../service"

module ShortURL
  module Services
    class Vgd < Service
      def initialize
        super("v.gd")

        @method = :get
        @action = "/create.php"
        @param = "format=simple&longurl"
      end
    end
  end
end
