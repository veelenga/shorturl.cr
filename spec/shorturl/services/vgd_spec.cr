require "../../spec_helper"

module ShortURL
  module Services
    describe Vgd do
      it "should have valid service characteristics" do
        isgd = Vgd.new
        isgd.hostname.should eq "v.gd"
        isgd.method.should eq :get
        isgd.action.should eq "/create.php"
        isgd.param.should eq "format=simple&longurl"
      end
    end
  end
end
