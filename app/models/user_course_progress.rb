class UserCourseProgress < ApplicationRecord
  belongs_to :user
  belongs_to :course
  belongs_to :medium, foreign_key: :medium_id

  validates :medium_id, presence: true
  validates :user_id, uniqueness: { scope: [:course_id, :medium_id] }
end
