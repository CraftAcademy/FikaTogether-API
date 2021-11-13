class AddSimilarityToFikas < ActiveRecord::Migration[6.1]
  def change
    add_column :fikas, :similarity, :float
    add_column :participants, :seniority, :integer
  end
end
