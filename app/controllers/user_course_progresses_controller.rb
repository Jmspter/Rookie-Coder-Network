class UserCourseProgressesController < ApplicationController
  before_action :authenticate_user!

  def update
    media = Medium.find(params[:id])
    course = media.course
    
    progress = current_user.user_course_progresses.find_or_initialize_by(
      media: media,
      course: course
    )
    
    progress.update!(completed: true)
    
    if current_user.completed_course?(course)
      certificate = current_user.certificates.create!(course: course, issued_at: Time.current)
      certificate.generate_pdf # Implementaremos isso
      redirect_to course_path(course), notice: 'Parabéns! Curso concluído e certificado disponível.'
    else
      redirect_to course_media_path(course, media.next_media || media), notice: 'Progresso salvo!'
    end
  end
end