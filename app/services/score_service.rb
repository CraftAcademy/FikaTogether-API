module ScoreService
  def self.score(fika)
    calc_date_difference = calc_date_difference(fika)
    difference_in_days = difference_in_days(calc_date_difference)
    assign_scores(difference_in_days, calc_date_difference)
  end

  def self.calc_date_difference(fika)
    participant_1 = fika[0]
    participant_2 = fika[1]
    (participant_1.start_date - participant_2.start_date).to_i
  end

  def self.difference_in_days(calc_date_difference)
    result = Math.sqrt(calc_date_difference * calc_date_difference).to_i
    result / (60 * 60 * 24)
  end

  def self.assign_scores(difference_in_days, calc_date_difference)
    case difference_in_days
    when 0..1825
      [5, 5]
    when 1826..3650
      calc_date_difference >= 0 ? [6, 4] : [4, 6]
    else
      calc_date_difference >= 0 ? [7, 3] : [3, 7]
    end
  end

  def self.participant_scores(fika)
    participant_1 = fika.participants.first
    participant_2 = fika.participants.second

    participant_1.fika_score = participant_1.fika_score + fika.score[0]
    participant_2.fika_score = participant_2.fika_score + fika.score[1]

    participant_1.save
    participant_2.save
  end
end
