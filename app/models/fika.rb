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

  def self.cosine_similarity(fika)
    @vector_1 = []
    @vector_2 = []
    normalize_start_dates(fika)
    binding.pry
  end

  def self.normalize_start_dates(fika)
    arr_start_date = Participant.pluck(:start_date).sort
    start_date_delta = Time.now.to_f - arr_start_date.first.to_f

    normalized_start_date_1 = (Time.now.to_f - fika.first.start_date.to_f) / start_date_delta
    normalized_start_date_2 = (Time.now.to_f - fika.last.start_date.to_f) / start_date_delta
    @vector_1.push(normalized_start_date_1)
    @vector_2.push(normalized_start_date_2)
  end
end
