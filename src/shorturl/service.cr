require "http/client"
require "./exceptions"

module ShortURL
  class Service
    getter port, code, method, action, param, ssl, hostname
    setter port, code, method, action, param, ssl

    def initialize(@hostname : String)
      @port = 80
      @code = 200
      @method = :post
      @action = "/"
      @ssl = false
      @param = "url"

      @http = HTTP::Client.new @hostname, @port, @ssl
    end

    def shorten(url : String)
      begin
        response = case @method
                   when :post
                     @http.post @action, body: "#{@param}=#{url}"
                   when :get
                     @http.get "#{@action}?#{@param}=#{url}"
                   end

        on_response response if response && response.status_code == @code
      rescue ex : Socket::Error
        raise ServiceNotAvailable.new ex.to_s, ex
      end
    end

    def on_body(body : String)
      body
    end

    def on_response(response : HTTP::Client::Response)
      on_body response.body
    end
  end
end
