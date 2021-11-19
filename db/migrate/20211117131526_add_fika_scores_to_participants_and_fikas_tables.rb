class AddFikaScoresToParticipantsAndFikasTables < ActiveRecord::Migration[6.1]
  def change
    add_column :fikas, :score, :integer, array: true, default: [5, 5]
    add_column :participants, :fika_score, :integer, default: 0
  end
end
