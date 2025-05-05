# app/models/certificate.rb
class Certificate < ApplicationRecord
  belongs_to :user
  belongs_to :course
  has_one_attached :pdf

  after_create :generate_and_attach_pdf

  def generate_and_attach_pdf
    # Gera o conteúdo do PDF
    pdf = Prawn::Document.new
    pdf.text "Certificado de Conclusão", size: 24, align: :center
    pdf.move_down 20
    pdf.text "Certificamos que #{user.username} concluiu o curso #{course.name}", size: 16, align: :center
    pdf.move_down 20
    pdf.text "Código: #{download_token}", size: 12, align: :center

    # Anexa o PDF
    self.pdf.attach(
      io: StringIO.new(pdf.render),
      filename: "certificado_#{download_token}.pdf",
      content_type: 'application/pdf'
    )
    
    self.save!
  end

  def self.validate_by_token(token)
    find_by(download_token: token)
  end
end