class CreateFikasParticipantsJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :fikas_participants, id: false do |t|
      t.belongs_to :fika
      t.belongs_to :participant
    end
  end
end
