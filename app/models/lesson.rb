class Lesson < ApplicationRecord
  belongs_to :course
  has_many :user_lessons, dependent: :destroy

  def previous_lesson
    course.lessons.where(lesson_order: lesson_order - 1).first
  end

  def next_lesson
    course.lessons.where(lesson_order: lesson_order + 1).first
  end
end
