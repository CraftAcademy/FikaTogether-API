class Departments::IndexSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :participants, serializer: Participants::IndexSerializer
end
