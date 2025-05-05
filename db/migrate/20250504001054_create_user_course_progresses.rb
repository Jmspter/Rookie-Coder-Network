class CreateUserCourseProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :user_course_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :course, null: false, foreign_key: true
      t.references :medium, null: false, foreign_key: true
      t.boolean :completed

      t.timestamps
    end
  end
end
