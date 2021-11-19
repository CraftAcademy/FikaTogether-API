module ScheduleService
  def self.match(fika_pairs, date, time_slots)

    time_slots.each do |slot|
      parsed_date = Date.parse(date).to_datetime
      time = Time.parse(slot)
      date_time = (parsed_date + time.seconds_since_midnight.seconds).to_datetime
      current_pair = fika_pairs.sample
      fika_pairs.slice!(fika_pairs.index(current_pair))
      fika = Fika.create(start_date: date_time, end_date: date_time + 45.minutes, participants: current_pair)
      binding.pry
    end

    fika_objects = []
    fika_pairs.each do |fika|
      participants_ids = []
      fika.each do |participant|
        participants_ids.push(participant.id)
      end
      fika_objects.push({ participant_ids: participants_ids })
    end

    fika_objects.each do |fika|
      
      date_time = (parsed_date + time.seconds_since_midnight.seconds).to_datetime
      fika[:start_date] = date_time
    end

    all_unique_fikas = []
    unique_participants_ids = sorted_fika_pairs.flatten.pluck(:id).uniq
    unique_participants_ids.each do |unique_participant|
      unique_fikas = []
      fika_objects.select do |fika|
        unique_fikas << fika if fika[:participant_ids].include? unique_participant
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
