class AddImageUrlToArenas < ActiveRecord::Migration[7.2]
  def change
    add_column :arenas, :image_url, :string
  end
end
