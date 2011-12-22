require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Flender" do
  describe "Config" do
    it "must retrieve github credential from config file" do
      conf = Flender::Config.read
      conf["auth"]["username"].should_not be_nil
    end
  end

  describe "Github" do
    it "must list repo if alice" do
      g = Flender::Github.new("thesp0nge")

      if (Flender::Github.reachable?)
        g.list_repos.should_not be_nil
      end
    end

  end
end
