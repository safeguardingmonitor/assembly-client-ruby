module Assembly
  class Subject < ApiModel
    include Assembly::Actions::Read
    include Assembly::Actions::List
  end

  Resource.build(Subject)
end
