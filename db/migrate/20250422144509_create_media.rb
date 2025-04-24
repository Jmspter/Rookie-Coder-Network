class CreateMedia < ActiveRecord::Migration[8.0]
  def change
    create_table :media do |t|
      t.string :title
      t.string :url
      t.string :type
      t.references :course, null: false, foreign_key: true

      t.timestamps
    end
  end
end
