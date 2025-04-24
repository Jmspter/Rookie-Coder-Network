class AddSlugToModalities < ActiveRecord::Migration[8.0]
  def change
    add_column :modalities, :slug, :string
    add_index :modalities, :slug, unique: true
  end
end
