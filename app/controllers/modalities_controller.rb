class ModalitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_modality, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, except: [:show, :index]

  def index
    @modalities = Modality.all
  end

  def show
  end

  def new
    @modality = Modality.new
  end

  def edit
  end

  def create
    @modality = Modality.new(modality_params)

    if @modality.save
      redirect_to @modality, notice: 'Modalidade criada com sucesso.'
    else
      render :new
    end
  end

  def update
    if @modality.update(modality_params)
      redirect_to @modality, notice: 'Modalidade atualizada com sucesso.'
    else
      render :edit
    end
  end

  def destroy
    @modality.destroy
    redirect_to root_path, notice: 'Modalidade removida com sucesso.'
  end

  private
    def set_modality
      @modality = Modality.friendly.find(params[:id] || params[:slug])
    end

    def modality_params
      params.require(:modality).permit(:name, :description)
    end
end