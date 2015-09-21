require "../../spec_helper"

module ShortURL
  module Services
    describe Isgd do
      it "should have valid service characteristics" do
        service = Isgd.new
        service.hostname.should eq "is.gd"
        service.method.should eq :get
        service.action.should eq "/api.php"
        service.param.should eq "longurl"
      end
    end
  end
end
