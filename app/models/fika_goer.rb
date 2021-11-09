class FikaGoer < ApplicationRecord

  has_and_belongs_to_many :fikas, join_table: 'fikas_fika_goers'
end
