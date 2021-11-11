class Department < ApplicationRecord

  validates_presence_of :name, :average_score
  has_and_belongs_to_many :participants

  private




end
