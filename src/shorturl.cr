require "./shorturl/*"
require "./shorturl/services/*"

module ShortURL
  SERVICES = {
    isgd:     Services::Isgd.new,
    tinyurl:  Services::TinyURL.new,
    vgd:      Services::Vgd.new
  } of Symbol => Service

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
  # ShortURL.shorten("http://google.com")        # => http://tinyurl.com/2tx
  # ShortURL.shorten("http://google.com", :isgd) # => http://is.gd/OwycZW
  # # ...
  # ```
  def self.shorten(url : String, service = :tinyurl)
    if SERVICES.has_key? service
      SERVICES[service].shorten url
    else
      raise InvalidService.new
    end
  end
end
