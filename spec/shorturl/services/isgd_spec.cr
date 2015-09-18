require "../../spec_helper"

module ShortURL
  module Services
    describe Isgd do
      it "should have valid service characteristics" do
        isgd = Isgd.new
        isgd.hostname.should eq "is.gd"
        isgd.method.should eq :get
        isgd.action.should eq "/api.php"
        isgd.param.should eq "longurl"
      end
    end
  end
end
