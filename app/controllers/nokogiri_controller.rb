require 'open-uri'
class NokogiriController < ApplicationController

  def extrair_imagens
    html = open(params[:dados_presente][:url_produto])
    doc = Nokogiri::HTML(html)
    @tags_img = doc.css("img")
    @imagens = @tags_img.to_s.split('"')

    @urls_img = []
    @imagens.each do |img|
      url_img = img.to_s
      if ( %w(.jpg jpeg).include?(url_img[-4..-1]) )
        Rails.logger.debug "--------- #{url_img[-4..-1]}"
        dimensoes_img = FastImage.size(url_img)
        if ( !dimensoes_img.nil? && (dimensoes_img[0] > 150) && (dimensoes_img[1] > 150) )
          Rails.logger.debug "----------------- #{dimensoes_img.to_s}"
          @urls_img << url_img
        end
      end
      #if img.to_s[-4..-1] == '.jpg'
      #  @urls_img << img.to_s
      #end
    end

    respond_to do |format|
      if @urls_img
        format.html { render partial: 'presentes/fotos' }
      else
        format.json { render json: call.errors, status: :unprocessable_entity }
      end
    end
  end
end