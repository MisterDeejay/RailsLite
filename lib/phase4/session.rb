require 'json'
require 'webrick'

module Phase4
  class Session
    # find the cookie for this app
    # deserialize the cookie into a hash
    def initialize(req)
      cookie = req.cookies.find { |c| c.name == "_rails_lite_app" }
      @cookie_data = cookie.nil? ? {} : JSON.parse(cookie.value)
    end

    def [](key)
      @cookie_data[key]
    end

    def []=(key, val)
      @cookie_data[key] = val
    end

    # serialize the hash into json and save in a cookie
    # add to the responses cookies
    def store_session(res)
      res.cookies << WEBrick::Cookie.new("_rails_lite_app", @cookie_data.to_json)
    end
  end
end
