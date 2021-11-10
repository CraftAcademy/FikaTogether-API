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
    normalize_management(fika)
    normalize_department(fika)
    calc_cosine_similarity
  end

  def self.normalize_start_dates(fika)
    arr_start_date = Participant.pluck(:start_date).sort
    start_date_delta = Time.now.to_f - arr_start_date.first.to_f

    normalized_start_date_1 = (Time.now.to_f - fika.first.start_date.to_f) / start_date_delta
    normalized_start_date_2 = (Time.now.to_f - fika.last.start_date.to_f) / start_date_delta
    @vector_1.push(normalized_start_date_1)
    @vector_2.push(normalized_start_date_2)
  end

  def self.normalize_management(fika)
    normalized_management_1 = fika.first.management && 1.0 || 0.0
    normalized_management_2 = fika.last.management && 1.0 || 0.0
    @vector_1.push(normalized_management_1)
    @vector_2.push(normalized_management_2)
  end

  def self.normalize_department(fika)
    if fika.pluck(:department).uniq.count > 1
      @vector_1.push(1.0)
      @vector_2.push(0.0)
    else
      @vector_1.push(0.0)
      @vector_2.push(0.0)
    end
  end

  def self.calc_cosine_similarity
    return nil if @vector_1.size != @vector_2.size

    dot_product = 0
    @vector_1.zip(@vector_2).each do |vector_1_component, vector_2_component|
      dot_product += vector_1_component * vector_2_component
    end
    a = @vector_1.map { |n| n**2 }.reduce(:+)
    b = @vector_2.map { |n| n**2 }.reduce(:+)
    dot_product / (Math.sqrt(a) * Math.sqrt(b))
  end
end
