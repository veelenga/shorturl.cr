require "../../spec_helper"

module ShortURL
  module Services
    describe Shorl do
      it "should have valid service characteristics" do
        service = Shorl.new
        service.hostname.should eq "shorl.com"
        service.method.should eq :get
        service.action.should eq "/create.php"
      end

      describe "#on_body" do
        it "returns extracts shorl url from body" do
          Shorl.new.on_body("<b>http://shorl.com/url</b>")
                   .should eq "http://shorl.com/url"
        end

        it "returns nil if shorl url not exists in body" do
          Shorl.new.on_body("<b>http://short.com/url</b>")
                   .should eq nil
        end
      end
    end
  end
end
