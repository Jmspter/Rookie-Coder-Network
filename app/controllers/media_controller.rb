class MediaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medium, only: [:show, :edit, :update, :destroy, :mark_as_completed]
  before_action :set_course, only: [:new, :create]
  before_action :require_admin, except: [:show, :mark_as_completed]

  def show
    @medium = Medium.find(params[:id])
    @midia = @medium 
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Mídia não encontrada'
  end

  def new
    @medium = @course.media.build
  end

  def edit
    @course = @medium.course
  end

  def create
    @medium = @course.media.build(medium_params)

    if @medium.save
      redirect_to @medium, notice: 'Mídia adicionada com sucesso.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @course = @medium.course 

    if @medium.update(medium_params)
      redirect_to @medium, notice: 'Mídia atualizada com sucesso.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    course_to_redirect = @medium.course 
    @medium.destroy
    redirect_to course_to_redirect, notice: 'Mídia removida com sucesso.'
  end

  def mark_as_completed
    @medium = Medium.find(params[:id])
    
    progress = current_user.user_course_progresses.find_or_initialize_by(
      medium_id: @medium.id,
      course_id: @medium.course_id
    )
  
    if progress.update(completed: true)
      certificate = current_user.certificates.create!(
        course: @medium.course, 
        issued_at: Time.current,
        download_token: SecureRandom.urlsafe_base64
      )
      redirect_to @medium.course, 
                  notice: 'Aula concluída!'
    end
  end
  

  private

  def set_medium
    @medium = Medium.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Mídia não encontrada'
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def medium_params
    params.require(:medium).permit(:title, :url, :media_type)
  end
end