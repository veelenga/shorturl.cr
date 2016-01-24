require "../spec_helper"

module ShortURL
  describe Service do
    describe "#new" do
      it "initializes new service with default values" do
        service = Service.new "tinyurl.com"
        service.hostname.should eq "tinyurl.com"
        service.port.should eq 80
        service.code.should eq 200
        service.method.should eq :post
        service.action.should eq "/"
        service.param.should eq "url"
        service.ssl.should eq false
      end

      it "can be initialized with custom values" do
        service = Service.new("tinyurl.com").tap do |s|
          s.port = 8080
          s.code = 404
          s.method = :post
          s.action = "/create"
          s.ssl = true
          s.param = "custom_url"
        end

        service.hostname.should eq "tinyurl.com"
        service.port.should eq 8080
        service.code.should eq 404
        service.method.should eq :post
        service.action.should eq "/create"
        service.ssl.should eq true
        service.param.should eq "custom_url"
      end
    end

    describe "#shorten" do
      context "when request code does not match" do
        it "should return nil" do
          WebMock.stub(:any, "tinyurl.com/create.php").to_return(status: 200, body: "shorten_url")
          service = Service.new("tinyurl.com").tap do |s|
            s.code = 404
            s.action = "/create.php"
          end
          service.shorten("http://google.com").should be_nil
        end
      end

      context "when given a valid service characteristics" do
        it "should return shorten url" do
          WebMock.stub(:any, "tinyurl.com/?url=http://google.com").to_return(status: 200, body: "shorten_url")
          service = Service.new("tinyurl.com").tap do |s|
            s.method = "/create.php"
            s.method = :get
          end
          service.shorten("http://google.com").should eq "shorten_url"
        end
      end
    end

    describe "#on_body" do
      it "returns body as is" do
        body = "http://url.com"
        service = Service.new ""
        service.on_body(body).should eq body
      end
    end

    describe "#on_response" do
      it "should return body on the response" do
        response = HTTP::Client::Response.new(200, "body")
        service = Service.new "http://tinyurl.com"
        service.on_response(response).should eq "body"
      end

      it "should return empty string if body not present" do
        response = HTTP::Client::Response.new(200, nil)
        service = Service.new "http://tinyurl.com"
        service.on_response(response).should eq ""
      end
    end
  end
end
