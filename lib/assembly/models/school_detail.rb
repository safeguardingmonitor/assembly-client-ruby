module Assembly
  class SchoolDetail < ApiModel
    include Assembly::Actions::Read
    include Assembly::Actions::List
  end

  Resource.build(SchoolDetail)
end
