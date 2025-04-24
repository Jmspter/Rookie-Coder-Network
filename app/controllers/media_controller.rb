class MediaController < ApplicationController
  before_action :authenticate_user!
  before_action :set_medium, only: [:show, :edit, :update, :destroy]
  before_action :set_course, only: [:new, :create]
  before_action :require_admin, except: [:show]

  def show
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

  private

  def set_medium
    @medium = Medium.find(params[:id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  def medium_params
    params.require(:medium).permit(:title, :url, :media_type)
  end
end