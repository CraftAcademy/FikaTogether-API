class CreateParticipants < ActiveRecord::Migration[6.1]
  def change
    create_table :departments do |t|
      t.string :name
      t.timestamps
    end
    create_table :participants do |t|
      t.string :name
      t.string :email
      t.datetime :start_date
      t.boolean :management, default: false
      t.belongs_to :department, foreign_key: true

      t.timestamps
    end
  end
end
