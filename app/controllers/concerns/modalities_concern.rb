module ModalitiesConcern
  extend ActiveSupport::Concern
  
  included do
    before_action :set_modalities
  end
  
  def set_modalities
    @modalities = Modality.all
  end
end