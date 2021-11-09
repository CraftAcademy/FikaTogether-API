class CreateFikaGoers < ActiveRecord::Migration[6.1]
  def change
    create_table :fika_goers do |t|
      t.string :name
      t.string :email
      t.datetime :start_date
      t.boolean :management, default: false

      t.timestamps
    end
  end
end
