require 'test_helper'

describe Assembly::GradeSet do
  include Assembly::TestData

  it "has an id" do
    assert_equal 1, Assembly::GradeSet.new(1).id
  end

  it "has a list of grades" do
    grade_set = Assembly::GradeSet.construct_from(example_grade_set)
    assert_equal 1, grade_set.grades.length
    assert_equal Assembly::Grade, grade_set.grades.first.class
    assert_equal 'A', grade_set.grades.first.name
  end
end