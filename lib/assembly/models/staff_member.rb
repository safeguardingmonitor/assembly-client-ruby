module Assembly
  class StaffMember < ApiModel
    include Assembly::Actions::List
  end

  Resource.build(StaffMember)
end