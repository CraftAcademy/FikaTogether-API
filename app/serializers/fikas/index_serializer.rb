class Fikas::IndexSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date
  has_many :participants, serializer: Participants::IndexSerializer
end
