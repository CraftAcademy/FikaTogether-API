class Departments::IndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :average_score
  has_many :participants, serializer: Participants::IndexSerializer
end
