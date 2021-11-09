class Fika < ApplicationRecord
  validates_presence_of :start_date, :end_date

  has_and_belongs_to_many :fika_goers, join_table: 'fikas_fika_goers'
end
