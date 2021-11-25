class AddAverageScore < ActiveRecord::Migration[6.1]
  def change
    add_column :departments, :average_score, :float, default: 0
    add_column :departments, :number_of_participants, :integer, default: 0
  end
end
