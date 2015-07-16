module Assembly
  module TestData
    def example_grade_set(params={})
      {
        object: 'grade_set',
        id: 72,
        name: 'test gradeset',
        grades: [example_grade]
      }.merge(params)
    end

    def example_grade(params={})
      {
        object: 'grade',
        name: 'A',
        value: 1
      }
    end

    def example_assessment_point(params={})
      {
        object: 'assessment_point',
        id: 28,
        name: 'test assessment_point'
      }.merge(params)
    end
  end
end