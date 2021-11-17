module ScoreService
  def self.fika_score(fika)
    delta = delta(fika)
    difference_in_days = calc_date_difference(delta)
    assign_score(difference_in_days, delta)
  end
  
  def self.delta(fika)
    participant_1 = fika[0]
    participant_2 = fika[1]
    (participant_1.start_date - participant_2.start_date).to_i
  end
  
  def self.calc_date_difference(delta)
    result = Math.sqrt(delta * delta).to_i
    result / (60 * 60 * 24)
  end
  
  def self.assign_score(difference_in_days, delta)
    # binding.pry
    case difference_in_days
    when 0..1825
      [5, 5]
    when 1826..3650
      if delta >= 0
      [6, 4]
      else
      [4, 6]
      end
    when 3651..Float::INFINITY
      if delta >= 0
      [7, 3]
      else
      [3, 7]
      end
    end
  end
end
