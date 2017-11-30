class SearchController < ApplicationController
  def index
    @result = Profesional.search(search_params[:termino_buscado], attributes)
    respond_to do |format|
      format.html
      format.csv { send_data Profesional.to_csv(@result), filename: "exportado_#{I18n.l(Time.now, format: :short).tr(" ","_")}.csv" }
    end
  end

  private
  def attributes
    attributes = []
    attributes << 'nombres'   if search_params[:nombre]
    attributes << 'apellido'  if search_params[:nombre]
    attributes << 'nro_doc'   if search_params[:documento]
    attributes << 'tipo_doc'  if search_params[:documento]
    attributes << 'matriculas.matricula' if search_params[:matricula]
    attributes
  end

  def search_params
    params.permit(:termino_buscado, :nombre, :documento, :matricula, :format)
  end
end
