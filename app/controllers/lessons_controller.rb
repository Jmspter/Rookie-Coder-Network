class LessonsController < ApplicationController
  before_action :authenticate_user!

  def show
    @lesson = Lesson.find(params[:id])
    previous_lesson = @lesson.previous_lesson

  end
  
  

  def complete
    lesson = Lesson.find(params[:id])
    user_lesson = UserLesson.find_or_initialize_by(user: current_user, lesson: lesson)
    user_lesson.update(completed: true)

    render json: { success: true }
  end

  def unlock_next
    lesson = Lesson.find(params[:id])
    next_lesson = lesson.next_lesson
  
    if next_lesson
      # Garante que o registro seja criado sem marcar como concluído
      UserLesson.find_or_create_by(user: current_user, lesson: next_lesson)
      redirect_to course_path(lesson.course), notice: 'Próxima aula desbloqueada!'
    else
      redirect_to course_path(lesson.course), alert: 'Não há mais aulas para desbloquear.'
    end
  end  
end
