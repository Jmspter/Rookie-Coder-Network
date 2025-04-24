class RenameTypeToMediaTypeInMedia < ActiveRecord::Migration[8.0]
  def change
    rename_column :media, :type, :media_type
  end
end
