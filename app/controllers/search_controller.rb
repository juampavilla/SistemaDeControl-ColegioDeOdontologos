class SearchController < ApplicationController
  def index
    @result = Profesional.search(params[:termino_buscado], attributes)
  end

  private
  def attributes
    attributes = []
    attributes << 'nombres'   if params[:nombre]
    attributes << 'apellido'  if params[:nombre]
    attributes << 'nro_doc'   if params[:documento]
    attributes << 'tipo_doc'  if params[:documento]
    attributes << 'matriculas.matricula' if params[:matricula]
    attributes
  end

  def search_params
    params.require(:termino_buscado).permit(:nombre, :documento)
  end
end
