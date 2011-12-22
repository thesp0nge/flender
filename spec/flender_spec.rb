require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe "Flender" do
  it "must retrieve github credential from config file" do
    conf = Flender::Config.read
    conf[:auth][:username].should_not be_nil
  end
  it "fails" do
    fail "hey buddy, you should probably rename this file and start specing for real"
  end
end
