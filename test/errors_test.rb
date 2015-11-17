require 'test_helper'

describe Assembly::ServerError do

  it "returns a default message when the response is empty" do
    error = Assembly::ServerError.new(mock(body: nil))
    assert_equal "No Error Message - Server response body was empty.", error.message
  end

  it "returns a default message when the response is an empty string" do
    error = Assembly::ServerError.new(mock(body: ""))
    assert_equal "No Error Message - Server response body was empty.", error.message
  end
end