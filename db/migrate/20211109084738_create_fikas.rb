class CreateFikas < ActiveRecord::Migration[6.1]
  def change
    create_table :fikas do |t|
      t.string :start_date
      t.string :end_date

      t.timestamps
    end
  end
end
