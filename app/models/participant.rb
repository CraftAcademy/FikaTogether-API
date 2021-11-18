class Participant < ApplicationRecord
  validates_presence_of :name, :email, :start_date, :seniority
  validates_inclusion_of :management, in: [true, false]

  has_and_belongs_to_many :fikas, join_table: 'fikas_participants'
  belongs_to :department
  has_one_attached :avatar

end
