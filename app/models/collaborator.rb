class Collaborator < ApplicationRecord
    belongs_to :users
    belongs_to :project 
end