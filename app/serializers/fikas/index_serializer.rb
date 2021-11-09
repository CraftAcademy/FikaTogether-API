class Fikas::IndexSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :end_date
  has_many :fika_goers, serializer: FikaGoers::IndexSerializer
end
