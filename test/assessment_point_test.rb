require 'test_helper'

describe Assembly::AssessmentPoint do
  include Assembly::TestData

  it "can create an assessment point" do
    assessment_point_options = {name: 'test'}
    Assembly.client.expects(:post)
      .with("/api/assessment_points", assessment_point_options)
      .returns(example_assessment_point)
    ap = Assembly::AssessmentPoint.create(assessment_point_options)
    assert_equal Assembly::AssessmentPoint, ap.class
    assert_equal 28, ap.id
    assert_equal 'test assessment_point', ap.name
  end

  it "can fetch an assessment point" do
    id = 28
    Assembly.client.expects(:get)
      .with("/api/assessment_points/#{id}")
      .returns(example_assessment_point)
    ap = Assembly::AssessmentPoint.fetch(id)
    assert_equal Assembly::AssessmentPoint, ap.class
  end

  it "can fetch an assessment point using a different client" do
    id = 28
    client = Assembly.client(token: 'another_token')
    client.expects(:get)
      .with("/api/assessment_points/#{id}")
      .returns(example_assessment_point)
    Assembly::AssessmentPoint.fetch(id, client)
  end

  it "can delete an assessment_point" do
    id = 28
    Assembly.client.expects(:get)
      .with("/api/assessment_points/#{id}")
      .returns(example_assessment_point)
    Assembly.client.expects(:delete)
      .with("/api/assessment_points/#{id}")
      .returns(example_assessment_point)
    ap = Assembly::AssessmentPoint.fetch(id)
    assert_equal true, ap.delete
  end

  it "can delete an assessment_point by id" do
    id = 28
    Assembly.client.expects(:delete)
      .with("/api/assessment_points/#{id}")
      .returns(example_assessment_point)
    assert_equal true, Assembly::AssessmentPoint.delete(id)
  end
end