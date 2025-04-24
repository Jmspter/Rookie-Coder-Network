class Medium < ApplicationRecord
  belongs_to :course

  # Validar a presença e inclusão usando o novo nome da coluna: media_type
  validates :title, presence: true
  validates :url, presence: true
  validates :media_type, presence: true, inclusion: { in: %w[video artigo pdf] }

  # O callback before_validation está correto, mas o método chamado dentro dele precisa ser corrigido
  before_validation :set_media_type_based_on_url

  private

  # Renomear o método para refletir sua função e corrigir o atributo que ele define
  def set_media_type_based_on_url
    # Verificar se media_type já foi definido (talvez pelo formulário) antes de tentar adivinhar pela URL
    unless self.media_type.present?
      if url.present? # Adicionar verificação se a URL está presente
        if url.include?('youtube.com') || url.include?('youtu.be')
          self.media_type = 'video'
        elsif url.end_with?('.pdf')
          self.media_type = 'pdf'
        else
          # Definir como 'artigo' apenas se não for vídeo ou pdf e tipo não foi definido
          self.media_type = 'artigo'
        end
      # else
        # O que fazer se a URL não estiver presente? A validação presence: true já cuidará disso.
      end
    end
  end

  # O método identificar_tipo original foi removido/substituído pelo set_media_type_based_on_url
  # Remova o método original identificar_tipo se ele ainda estiver no seu arquivo.
end