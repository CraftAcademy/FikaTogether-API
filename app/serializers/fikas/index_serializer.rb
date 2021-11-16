class Fikas::IndexSerializer < ActiveModel::Serializer
  attributes :id, :start_date, :similarity
  has_many :participants, serializer: Participants::IndexSerializer

  def start_date
    object.start_date.strftime('%-d/%-m/%Y %H:%M')
  end
end
