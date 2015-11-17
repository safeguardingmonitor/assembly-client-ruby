require 'test_helper'
require 'test_model'

describe Assembly::Model do

  let(:model) { Assembly::ApiTestModel.new(1, Assembly.client) }

  it "has a resource path based on the class name" do
    assert_equal "/api/api_test_models", Assembly::ApiTestModel.path
  end

  it "has a resource path for an instance based on the class name and instance id" do
    assert_equal "/api/api_test_models/1", model.path
  end

  it "raises if a nil id is passed" do
    assert_raises(ArgumentError) { Assembly::ApiTestModel.fetch(nil) }
  end
  it "raises if a blank id is passed" do
    assert_raises(ArgumentError) { Assembly::ApiTestModel.fetch('') }
  end
end