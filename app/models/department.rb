class Department < ApplicationRecord
  validates_presence_of :name
  has_many :participants

  def self.number_of_participants
    departments = Department.all
    departments.each do |department|
      department.number_of_participants = department.participants.count
      department.save
    end
  end

  def self.calculate_average_score
    departments = Department.all
    departments.each do |department|
      individual_scores = department.participants.pluck(:fika_score)
      num_participants = department.participants.count
      department.average_score = individual_scores.sum / num_participants
      department.save
    end
  end
end
