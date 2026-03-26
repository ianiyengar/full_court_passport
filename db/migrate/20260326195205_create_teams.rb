class CreateTeams < ActiveRecord::Migration[7.2]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :city
      t.string :abbreviation

      t.timestamps
    end
  end
end
