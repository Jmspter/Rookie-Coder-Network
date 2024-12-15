class CursosController < ApplicationController
  before_action :set_curso, only: [:show]

  def index
    @cursos = Curso.all
  end

  def show
    @aulas = @curso.aulas.order(:id)
  end

  private

  def set_curso
    @curso = Curso.find(params[:id])
  end
end
