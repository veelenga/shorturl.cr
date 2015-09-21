require "../../spec_helper"

module ShortURL
  module Services
    describe Vgd do
      it "should have valid service characteristics" do
        service = Vgd.new
        service.hostname.should eq "v.gd"
        service.method.should eq :get
        service.action.should eq "/create.php"
        service.param.should eq "format=simple&longurl"
      end
    end
  end
end
