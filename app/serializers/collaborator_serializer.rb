class CollaboratorSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :user_id, :project_id
end
