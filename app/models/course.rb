class Course < ApplicationRecord
  belongs_to :modality
  has_many :media, dependent: :destroy
  has_many :user_course_progresses
  has_many :certificates

  validates :name, presence: true
  validates :modality, presence: true

  def progress_for(user)
    total_media = media.count
    return 0 if total_media.zero?

    completed = user.user_course_progresses.where(course: self, completed: true).count
    (completed.to_f / total_media * 100).round
  end
end
