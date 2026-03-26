class CreateArenas < ActiveRecord::Migration[7.2]
  def change
    create_table :arenas do |t|
      t.string :name
      t.string :city
      t.string :state
      t.string :country
      t.integer :capacity
      t.string :first_nba_season
      t.text :description
      t.references :team, null: false, foreign_key: true
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
