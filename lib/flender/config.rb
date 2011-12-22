module Flender
  class Config

    # Reads the flender configuration as found in the conf/flender.conf.yaml file
    #
    # @return [{Symbol => String/Fixnum}] The configuration hash
    def self.read
      @conf = {}

      @conf
    end

  end
end
