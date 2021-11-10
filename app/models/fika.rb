class Fika < ApplicationRecord
  validates_presence_of :start_date, :end_date

  has_and_belongs_to_many :participants, join_table: 'fikas_participants'

  def self.participants_uniq_matcher
    participants = Participant.all
    arr = participants.to_a.permutation(2).to_a
    arr_sorted = []
    arr.each do |pair|
      arr_sorted.push(pair.sort_by(&:id))
    end
    arr_sorted.uniq!
    arr_sorted
  end
end
