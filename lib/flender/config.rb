require 'yaml'

module Flender
  class Config

    # Reads the flender configuration as found in the conf/flender.conf.yaml file
    #
    # @return [{Symbol => String/Fixnum}] The configuration hash
    def self.read
      begin
        @conf = YAML.load_file("conf/flender.conf.yaml")
      rescue
        @conf = {}
      end


      @conf
    end

  end
end
