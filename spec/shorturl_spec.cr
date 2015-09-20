require "./spec_helper"

module ShortURL
  describe SERVICES do
    it "defines valid services with it's names" do
      SERVICES.empty?.should eq false
    end
  end

  describe ".all_services" do
    it "returns a list of available services names" do
      ShortURL.all_services.should contain :tinyurl
    end
  end

  describe ".shorten" do
    context "when no service given" do
      it "uses default service and shorten an url" do
        ShortURL.shorten("http://google.com").should match /tinyurl/
      end
    end

    context "when service is given" do
      it "uses given service and shorten an url" do
        ShortURL.shorten("http://google.com", :isgd).should match /is\.gd/
      end
    end

    context "when given not valid service" do
      it "raises InvalidService exception" do
        expect_raises(InvalidService) { ShortURL.shorten "http://google.com", :invalid_service }
      end
    end
  end

  describe ".expand" do
    context "when short url valid" do
      it "successfully expands it" do
        short = ShortURL.shorten("http://google.com").not_nil!
        ShortURL.expand(short).should eq "http://google.com"
      end
    end

    context "when short url invalid" do
      it "rasises InvalidShortURL exception" do
        expect_raises(InvalidShortURL) { ShortURL.expand("http://no_such_url") }
      end
    end

    context "when short url does not exist" do
      it "rasises InvalidShortURL exception" do
        expect_raises(InvalidShortURL) { ShortURL.expand("http://tinyurl.com/no_such_url") }
      end
    end
  end
end
