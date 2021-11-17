module ScoreService
  def self.assign_score(fika)
    participant_1 = fika.participants.first
    participant_2 = fika.participants.last

    delta = (participant_1.start_date - participant_2.start_date).to_i
    result = Math.sqrt(delta * delta).to_i
    difference_in_days = result / (60 * 60 * 24)
    fika.fika_score = case difference_in_days
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

    fika.save
  end
end
