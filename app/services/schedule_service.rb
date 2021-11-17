module ScheduleService
  def self.match(fika_pairs, date, time_slots)
    unique_participants_ids = fika_pairs.uniq {|pair| pair.pluck(:id)}
    binding.pry
    fika_objects = []
    fika_pairs.each do |fika|
      participants_ids = []
      fika.each do |participant|
        participants_ids.push(participant.id)
      end
      fika_objects.push({ participant_ids: participants_ids })
    end

    fika_objects.each do |fika|
      parsed_date = Date.parse(date).to_datetime
      time = Time.parse(time_slots.first)
      date_time = (parsed_date + time.seconds_since_midnight.seconds).to_datetime
      fika[:start_date] = date_time
    end

    all_unique_fikas = []

    unique_participants_ids.each do |unique_participant|
      unique_fikas = []
      fika_objects.select do |fika|
        if fika[:participant_ids].include? unique_participant 
          unique_fikas << fika
        end
      end
      all_unique_fikas << unique_fikas
    end

    fika_objects.each do |fika|
      fika[:participants].each do |participant|
        # ????
      end
    end
  end
end
