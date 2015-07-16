require 'test_helper'
require 'test_model'

describe Assembly::Resource do
  let(:client) { Assembly.client }
  let(:model)  { Assembly::ApiTestModel.new({ id: 1 })}
  let(:record) { { test: 1 } }

  it "builds a resource from a model" do
    Assembly::Resource.build(Assembly::ApiTestModel)
    assert Assembly::ApiTestModelResource
  end

  it "allows creating a record" do
    Assembly::ApiTestModel.expects(:create).with(record, client).returns(model)
    resource = Assembly::Resource.resource_class_for(Assembly::ApiTestModel).new(client)
    assert_equal model, resource.create(record)
  end

  it "allows listing records" do
    Assembly::ApiTestModel.expects(:list).with(client).returns([model])
    resource = Assembly::Resource.resource_class_for(Assembly::ApiTestModel).new(client)
    assert_equal [model], resource.list
  end

  it "allows deleting a record" do
    Assembly::ApiTestModel.expects(:delete).with(1, client).returns(true)
    resource = Assembly::Resource.resource_class_for(Assembly::ApiTestModel).new(client)
    assert_equal true, resource.delete(1)
  end

  it "allows updating a record" do
    Assembly::ApiTestModel.expects(:update).with(1, record, client).returns(model)
    resource = Assembly::Resource.resource_class_for(Assembly::ApiTestModel).new(client)
    assert_equal model, resource.update(1, record)
  end
end