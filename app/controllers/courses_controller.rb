class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: [:show, :edit, :update, :destroy]
  before_action :set_modality, only: [:new, :create]
  before_action :require_admin, except: [:show, :index]

  def index
    if params[:q].present?
      @courses = Course.where("name ILIKE ?", "%#{params[:q]}%")
    else
      @courses = Course.all
    end
  end  

  def show
  end

  def new
    @course = @modality.courses.build
  end

  def edit
  end

  def create
    @course = @modality.courses.build(course_params)

    if @course.save
      redirect_to [@modality, @courses], notice: 'Curso criado com sucesso.'
    else
      render :new
    end
  end

  def update
    if @course.update(course_params)
      redirect_to @course, notice: 'Curso atualizado com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @course.destroy
    redirect_to @course.modality, notice: 'Curso removido com sucesso.'
  end

  private
    def set_course
      @course = Course.find(params[:id])
    end

    def set_modality
      @modality = Modality.find_by!(slug: params[:modality_slug])
    end

    def course_params
      params.require(:course).permit(:name, :description)
    end
end
