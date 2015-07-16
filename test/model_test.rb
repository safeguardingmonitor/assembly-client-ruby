require 'test_helper'
require 'test_model'

describe Assembly::Model do

  let(:model) { Assembly::TestModel.new(1, Assembly.client) }

  it "has an id" do
    assert_equal 1, model.id
  end

  it "has a client" do
    assert_equal Assembly.client, model.client
  end

  describe '.merge' do
    it "can add properties" do
      model.merge(name: 'test')
      assert_equal 'test', model.name
    end

    it "can update properties" do
      model.merge(name: 'test').merge(name: 'test2')
      assert_equal 'test2', model.name
    end
  end

  describe '#construct_from' do
    it "can build a new instance with response params" do
      andy = Assembly::TestModel.construct_from({id:1, name: 'andy'})
      assert_equal 'andy', andy.name
    end
  end

  describe ".dirty?" do
    it "returns false if values are clean" do
      model.update_from(name: 'andy')
      refute model.dirty?
    end

    it "returns true if values are dirty" do
      model.update_from(name: 'andy')
      model.name = 'nick'
      assert model.dirty?
    end
  end

  it "can act as a hash" do
    model.merge(name: 'andy')
    assert_equal 'andy', model[:name]
    assert_equal 'andy', model['name']
  end

  it "builds decendent objects from hashes" do
    model.update_from(location: {lat: 1, lng:2})
    assert_equal Assembly::Model, model.location.class
    assert_equal 1, model.location.lat
    assert_equal 2, model.location.lng
  end
end