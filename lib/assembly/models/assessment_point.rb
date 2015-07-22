module Assembly
  class AssessmentPoint < ApiModel
    include Assembly::Actions::Read
    include Assembly::Actions::List
    include Assembly::Actions::Create
    include Assembly::Actions::Delete
  end

  Resource.build(AssessmentPoint)
end