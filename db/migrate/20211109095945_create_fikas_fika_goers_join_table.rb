class CreateFikasFikaGoersJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_table :fikas_fika_goers, id: false do |t|
      t.belongs_to :fika
      t.belongs_to :fika_goer
    end
  end
end
