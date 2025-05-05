class AddMediaIdToUserCourseProgresses < ActiveRecord::Migration[8.0]
  def change
    add_reference :user_course_progresses, :media, null: false, foreign_key: true
  end
end
