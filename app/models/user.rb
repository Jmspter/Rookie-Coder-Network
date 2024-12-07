class User < ApplicationRecord
  has_many :articles
  has_many :user_lessons

  def completed?(lesson)
    UserLesson.exists?(user: self, lesson: lesson, completed: true)
  end

  def unlocked?(lesson)
    UserLesson.exists?(user: self, lesson: lesson)
  end
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
