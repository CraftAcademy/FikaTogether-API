class Departments::IndexSerializer < ActiveModel::Serializer
  attributes :id, :name, :average_score, :number_of_participants
  has_many :participants, serializer: Participants::IndexSerializer
end
