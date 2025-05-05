class ConsolidateMediaColumnsInUserCourseProgresses < ActiveRecord::Migration[8.0]
  def up
    execute <<-SQL
      UPDATE user_course_progresses 
      SET medium_id = media_id 
      WHERE medium_id IS NULL AND media_id IS NOT NULL
    SQL

    remove_column :user_course_progresses, :media_id
  end

  def down
    add_column :user_course_progresses, :media_id, :bigint
    add_foreign_key :user_course_progresses, :media, column: :media_id
  end
end
