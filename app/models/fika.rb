class Fika < ApplicationRecord
  validates_presence_of :start_date, :end_date, :score
  has_and_belongs_to_many :participants, join_table: 'fikas_participants', presence: true
  after_validation :create_calendar_entry
  after_create :assign_participant_fika_scores

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

  def assign_participant_fika_scores
    participant_1 = Fika.last.participants[0]
    participant_2 = Fika.last.participants[1]

    participant_1.fika_score += Fika.last.score[0]
    participant_2.fika_score += Fika.last.score[1]

    participant_1.save
    participant_2.save
  end
end
