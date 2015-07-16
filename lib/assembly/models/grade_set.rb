module Assembly
  class GradeSet < ApiModel
    include Assembly::Actions::Read
    include Assembly::Actions::Create
  end

  Resource.build(GradeSet)
end