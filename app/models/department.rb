class Department < ApplicationRecord
  validates_presence_of :name, :average_score
  has_many :participants
end
