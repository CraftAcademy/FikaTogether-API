class Fika < ApplicationRecord
  validates_presence_of :start_date, :end_date, :fika_score
  has_and_belongs_to_many :participants, join_table: 'fikas_participants', presence: true
  after_validation :create_calendar_entry
  # before_create :assign_fika_score

  private

  def self.participants_uniq_matcher
    possible_participant_pairings = Participant.all.to_a.permutation(2).to_a
    unique_pairings = []
    possible_participant_pairings.each do |pair|
      unique_pairings.push(pair.sort_by(&:id))
    end
    unique_pairings.uniq
  end

  def create_calendar_entry
    InviteService.create_invite(self)
  rescue StandardError
    raise StandardError, 'We are experiencing problems with Google calendar at the moment, please try again later!'
  end

  # def assign_fika_score
  #   ScoreService.assign_score(self)
  # end
end
