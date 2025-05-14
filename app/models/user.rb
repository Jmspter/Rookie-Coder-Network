class User < ApplicationRecord
  has_many :user_course_progresses
  has_many :certificates
  has_many :completed_media, through: :user_course_progresses, source: :medium
  has_many :favorites, dependent: :destroy
  has_many :favorite_courses, through: :favorites, source: :course
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable

  validates :username, presence: true

  attr_accessor :terms_of_service

  validates :terms_of_service, acceptance: { accept: '1', message: "deve ser aceito" }

  def admin?
    self.admin
  end

  def completed_course?(course)
    course_media_ids = course.media.pluck(:id)
    return false if course_media_ids.empty?
  
    completed_media_ids = user_course_progresses
                         .where(course_id: course.id, completed: true)
                         .pluck(:medium_id)
  
    (course_media_ids - completed_media_ids).empty?
  end
end
