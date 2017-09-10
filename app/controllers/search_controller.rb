class SearchController < ApplicationController
  def index
    @result = Profesional.search(search_params[:termino_buscado], attributes)
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
    params.permit(:termino_buscado, :nombre, :documento, :matricula)
  end
end
