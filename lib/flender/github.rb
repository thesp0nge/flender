require 'socket'
require 'net/https'
require 'uri'

# Flender::Github is our github interface
module Flender
  class Github
    BASE_URL = "https://api.github.com/"

    # Creates a new Github APIs interface for that user
    #
    # @param [String] the user we want to play the repos with
    def initialize(user)
      @base_url = BASE_URL + "/users/" + user
    end
    
    def list_repos
      call("/repos")
    end

    # Check if we can reach github APIs via HTTPS
    #
    # @return [Boolean] true if we can reach github APIs
    def self.reachable?
      begin
        s=TCPSocket.new("api.github.com", 443)
        s.close
        true
      rescue
        false
      end
    end

    private
    def call(service)

      uri = URI.parse(@base_url+service)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      http.verify_mode = OpenSSL::SSL::VERIFY_NONE
      req = Net::HTTP::Get.new(uri.request_uri)
      res = http.request(req)
      if res.status == 200
        res.body
      else 
        nil
      end

    end

  end
end
