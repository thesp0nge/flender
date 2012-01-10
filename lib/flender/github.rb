require 'rest-client'
require 'json'
require 'socket'
require 'uri'

# Flender::Github is our github interface
module Flender
  class Github
    BASE_URL = "https://api.github.com"

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
      response = RestClient.get(@base_url+service)#, {:params=>{:user => "username", :password => "123456"}} )
      j=JSON.parse(response.body)
      p j.size

    end

  end
end
