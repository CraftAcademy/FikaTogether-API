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
      department.average_score = (individual_scores.sum.to_f / department.number_of_participants).round(2)
      department.save
    end
  end
end
