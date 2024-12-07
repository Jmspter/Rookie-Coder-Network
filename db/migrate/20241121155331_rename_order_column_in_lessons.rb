class RenameOrderColumnInLessons < ActiveRecord::Migration[6.1]
  def change
    rename_column :lessons, :order, :lesson_order
  end
end
