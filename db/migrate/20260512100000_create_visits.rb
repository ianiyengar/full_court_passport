class CreateVisits < ActiveRecord::Migration[7.2]
  def change
    create_table :visits do |t|
      t.references :arena, null: false, foreign_key: true
      t.integer :status, null: false, default: 1
      t.text :notes
      t.text :concessions
      t.text :favorite_spots
      t.date :game_date
      t.string :score_url
      t.string :photo_url
      t.bigint :user_id

      t.timestamps
    end

    add_index :visits, :user_id
  end
end
