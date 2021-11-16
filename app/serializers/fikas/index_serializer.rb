class Fikas::IndexSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date, :similarity, :formated_start_date, :formated_end_date
  has_many :participants, serializer: Participants::IndexSerializer
end
