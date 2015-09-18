require "../../spec_helper"

module ShortURL
  module Services
    describe TinyURL do
      it "should have valid service characteristics" do
        isgd = TinyURL.new
        isgd.hostname.should eq "tinyurl.com"
        isgd.method.should eq :get
        isgd.action.should eq "/api-create.php"
      end
    end
  end
end

