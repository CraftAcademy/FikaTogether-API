class Fika < ApplicationRecord
  validates_presence_of :start_date, :end_date
end
