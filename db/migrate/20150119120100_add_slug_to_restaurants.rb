class AddSlugToRestaurants < ActiveRecord::Migration
  def change
    add_column :restaurantes, :slug, :string
  end
end
