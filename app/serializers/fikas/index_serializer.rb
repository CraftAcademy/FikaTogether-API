class Fikas::IndexSerializer < ActiveModel::Serializer
  attributes :id, :formated_start_date, :formated_end_date, :similarity
  has_many :participants, serializer: Participants::IndexSerializer
end
