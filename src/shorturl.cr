require "./shorturl/*"
require "./shorturl/services/*"
require "http/client"

module ShortURL
  SERVICES = {
    "isgd" =>    Services::Isgd.new,
    "tinyurl" => Services::TinyURL.new,
    "vgd" =>     Services::Vgd.new,
    "shorl" =>   Services::Shorl.new,
  }

  # Returns all available shortening services.
  #
  # ```
  # ShortURL.all_services # => [:isgd, :tinyurl, ...]
  # ```
  def self.all_services
    SERVICES.keys
  end

  # Shortens an url using one of the available services.
  #
  # ```
  # ShortURL.shorten("http://google.com")        # => "http://tinyurl.com/2tx"
  # ShortURL.shorten("http://google.com", :isgd) # => "http://is.gd/OwycZW"
  # # ...
  # ```
  def self.shorten(url : String, service = :tinyurl)
    service = service.to_s if service.is_a? Symbol
    if SERVICES.has_key? service
      SERVICES[service].shorten url
    else
      raise InvalidService.new "Service not exists '#{service}'. Available services: #{SERVICES.keys.join ", "}"
    end
  end

  # Expands shortened url via http get request.
  #
  # ```
  # ShortURL.expand("http://tinyurl.com/2tx") # => "http://google.com"
  # ```
  #
  # Raises `ShortURL::InvalidShortURL` if `short_url` is invalid and it
  # can not be expanded.
  def self.expand(short_url : String)
    HTTP::Client.get(short_url).headers["Location"]
  rescue ex : Exception
    raise InvalidShortURL.new short_url, ex
  end
end
