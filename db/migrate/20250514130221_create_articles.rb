class CreateArticles < ActiveRecord::Migration[8.0]
  def change
    create_table :articles do |t|
      t.string :subject
      t.string :title
      t.text :subtitle
      t.string :button

      t.timestamps
    end
  end
end
