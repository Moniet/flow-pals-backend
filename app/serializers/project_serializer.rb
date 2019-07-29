class ProjectSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :content
end
