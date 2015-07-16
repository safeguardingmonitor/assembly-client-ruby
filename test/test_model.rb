class Assembly::TestModel < Assembly::Model
end

class Assembly::ApiTestModel < Assembly::ApiModel
  include Assembly::Actions::Read
  include Assembly::Actions::List
  include Assembly::Actions::Create
  include Assembly::Actions::Update
  include Assembly::Actions::Delete
end