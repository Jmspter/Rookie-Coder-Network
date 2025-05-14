class FavoritesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course

  def create
    @favorite = current_user.favorites.create(course: @course)
    respond_to do |format|
      format.html { redirect_to @course, notice: 'Curso adicionado aos favoritos!' }
      format.js
    end
  end

  def destroy
    @favorite = current_user.favorites.find_by(course: @course)
    @favorite.destroy if @favorite
    respond_to do |format|
      format.html { redirect_to @course, notice: 'Curso removido dos favoritos.' }
      format.js
    end
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end
end