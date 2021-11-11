module SimilarityService
  def self.cosine_similarity(fika)
    @fika = fika
    @vector_1 = []
    @vector_2 = []
    normalize_start_dates
    normalize_management
    normalize_department
    binding.pry
    calc_cosine_similarity
  end

  def self.normalize_start_dates
    arr_start_date = Participant.pluck(:start_date).sort
    start_date_delta = Time.now.to_f - arr_start_date.first.to_f

    normalized_start_date_1 = (Time.now.to_f - @fika.first.start_date.to_f) / start_date_delta
    normalized_start_date_2 = (Time.now.to_f - @fika.last.start_date.to_f) / start_date_delta
    @vector_1.push(normalized_start_date_1)
    @vector_2.push(normalized_start_date_2)
  end

  def self.normalize_management
    normalized_management_1 = @fika.first.management && 0.20 || 0.10
    normalized_management_2 = @fika.last.management && 0.20 || 0.10
    @vector_1.push(normalized_management_1)
    @vector_2.push(normalized_management_2)
  end

  def self.normalize_department
    if @fika.pluck(:department).uniq.count > 1
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
