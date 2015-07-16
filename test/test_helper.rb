$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'assembly'
require 'test_data'

require 'minitest/autorun'
require 'minitest/spec'
require 'minitest/reporters'
require 'minitest/mock'

require 'mocha/mini_test'
require 'webmock/minitest'

WebMock.disable_net_connect!
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(color: true)]