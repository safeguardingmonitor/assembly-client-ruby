require 'test_helper'
require 'test_model'

describe Assembly::List do

  let(:model) { Assembly::List.new(nil, Assembly.client) }

  it "has a client" do
    assert_equal Assembly.client, model.client
  end

  describe '.next_page' do
    it "exists even if not set" do
      assert_nil model.next_page
    end

    it "returns the :next_page value if set" do
      model.merge(next_page: 2)
      assert_equal 2, model.next_page
    end
  end

  describe '.prev_page' do
    it "exists even if not set" do
      assert_nil model.prev_page
    end

    it "returns the :prev_page value if set" do
      model.merge(prev_page: 2)
      assert_equal 2, model.prev_page
    end
  end

  describe '.total_pages' do
    it "defaults to 1 if not set" do
      assert_equal 1, model.total_pages
    end

    it "returns the :total_pages value if set" do
      model.merge(total_pages: 2)
      assert_equal 2, model.total_pages
    end
  end

  describe '.total_count' do
    it "defaults to 0 if not set" do
      assert_equal 0, model.total_count
    end

    it "returns the :total_count value if set" do
      model.merge(total_count: 2)
      assert_equal 2, model.total_count
    end
  end

  describe '.current_page' do
    it "defaults to 1 if not set" do
      assert_equal 1, model.current_page
    end

    it "returns the :current_page value if set" do
      model.merge(current_page: 2)
      assert_equal 2, model.current_page
    end
  end
end