module ScoreService
  def self.score(fika)
    calc_date_difference = calc_date_difference(fika)
    difference_in_years = difference_in_years(calc_date_difference)
    assign_scores = assign_scores(difference_in_years, calc_date_difference)
  end

  def self.calc_date_difference(fika)
    participant_1 = fika[0]
    participant_2 = fika[1]
    (participant_1.start_date - participant_2.start_date)
  end

  def self.difference_in_years(calc_date_difference)
    (calc_date_difference / (60 * 60 * 24 * 365)).abs 
  end

  def self.assign_scores(difference_in_years, calc_date_difference)
    case difference_in_years
    when 0..5 #years
      [5, 5]
    when 5..10 #years
      is_positive(calc_date_difference) ? [6, 4] : [4, 6]
    else
      is_positive(calc_date_difference) ? [7, 3] : [3, 7]
    end
  end

  def self.is_positive(num)
    num >= 0
  end
end