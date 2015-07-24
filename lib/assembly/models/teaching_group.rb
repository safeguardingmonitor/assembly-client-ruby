module Assembly
  class TeachingGroup < ApiModel
    include Assembly::Actions::Read
    include Assembly::Actions::List

    def students
      response = client.get(path + '/students')
      Util.build(response, client)
    end
  end

  Resource.build(TeachingGroup)
end