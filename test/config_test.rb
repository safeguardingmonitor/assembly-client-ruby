require 'test_helper'

describe Assembly::Config do
  it "gets default config in inititalization" do
    config = Assembly::Config.new
    assert_equal "http://platform.assembly.education", config.host
  end

  it "allows merging config options" do
    config = Assembly::Config.new
    config.merge(host: 'http://test.com')
    assert_equal 'http://test.com', config.host
  end

  it "allows overriding a cop of the config options" do
    config = Assembly::Config.new
    new_config = config.copy_with_overrides(host: 'http://test.com')
    assert_equal "http://platform.assembly.education", config.host
    assert_equal 'http://test.com', new_config.host
  end

  it "allows configuration on the root module via options hash" do
    Assembly.configure(host: 'http://test1.com')
    assert_equal "http://test1.com", Assembly.config.host
    Assembly.config = Assembly::Config.new # be sure to reset the global shared config
  end

  it "allows configuration on the root module via a block" do
    Assembly.configure do |c|
      c.host = 'http://test2.com'
    end
    assert_equal "http://test2.com", Assembly.config.host
    Assembly.config = Assembly::Config.new # be sure to reset the global shared config
  end
end
