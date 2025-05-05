class CertificatesController < ApplicationController
  before_action :authenticate_user!
  skip_before_action :authenticate_user!, only: [:validate]

  def show
    @certificate = current_user.certificates.find(params[:id])
    
    unless @certificate.pdf.attached?
      @certificate.generate_and_attach_pdf
      flash[:notice] = 'Certificado gerado com sucesso!'
    end
  rescue ActiveRecord::RecordNotFound
    redirect_to root_path, alert: 'Certificado não encontrado'
  end
  
  def download
    @certificate = current_user.certificates.find(params[:id])
    
    if @certificate.pdf.attached?
      redirect_to rails_blob_url(@certificate.pdf, disposition: 'attachment')
    else
      redirect_to certificate_path(@certificate), alert: 'Certificado ainda não está disponível. Tente novamente em alguns instantes.'
    end
  end

  def validate
    if params[:token].present?
      @certificate = Certificate.find_by(download_token: params[:token])
      
      if @certificate.nil?
        flash.now[:alert] = 'Certificado não encontrado. Verifique o código e tente novamente.'
      end
    end
  end
end