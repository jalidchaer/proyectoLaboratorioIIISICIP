class PrincipalController < ApplicationController
  def index
  end

  def sc
   @objMyAesCtr = MyAesCtr.new
   session[:comedoronline_encriptado] = @objMyAesCtr.encrypt(LaboratorioLiscano::Application::COMEDORONLINE.to_s,LaboratorioLiscano::Application::COMEDORONLINE.to_s,256).strip
   @tirajson = '{"success": "true", "exito": true, "sc1":"'+session[:comedoronline_encriptado].to_s+'", "sc2": 256 }'
   render :text => @tirajson
  end
end
