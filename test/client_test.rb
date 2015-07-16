require 'test_helper'

describe Assembly::Client do
  it "inititalizes with a default shared config" do
    client = Assembly::Client.new
    assert_equal Assembly.config, client.config
  end

  it "inititalizes with a pased config" do
    my_config = Assembly::Config.new
    client = Assembly::Client.new(my_config)
    assert_equal my_config, client.config
  end
end