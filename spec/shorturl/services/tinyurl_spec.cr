require "../../spec_helper"

module ShortURL
  module Services
    describe TinyURL do
      it "should have valid service characteristics" do
        service = TinyURL.new
        service.hostname.should eq "tinyurl.com"
        service.method.should eq :get
        service.action.should eq "/api-create.php"
      end
    end
  end
end
