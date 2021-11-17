module ScheduleService
  def self.match(fikas, date, time_slots)
    fika_objects = []
    fikas.each do |fika|
      participants_ids = []
      fika.each do |participant|
        participants_ids.push(participant.id)
      end
      fika_objects.push({participants: participants_ids})
    end
    
    
    fika_objects.each do |fika|
      parsed_date = Date.parse(date).to_datetime
      time = Time.parse(time_slots.first)
      date_time = (parsed_date + time.seconds_since_midnight.seconds).to_datetime      
      fika[:start_date] = date_time
    end

    
    fika_objects.each do |fika|
      fika[:participants].each do |participant|
        # ????  
      end
    end    
  end
end