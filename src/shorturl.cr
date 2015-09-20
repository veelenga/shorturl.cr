require "./shorturl/*"

module ShortURL
  SERVICES = {
    tinyurl:  Services::TinyURL.new,
    isgd:     Services::Isgd.new
  } of Symbol => Service

  # Returns all available shortening services.
  #
  # ```
  # ShortURL.all_services # => [:tinyurl, :isgd, ...]
  # ```
  def self.all_services
    SERVICES.keys
  end

  # Makes a shortening of the url using one of the 
  # available services.
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
