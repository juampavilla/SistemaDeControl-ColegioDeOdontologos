class SearchController < ApplicationController
  def index
    attributes = ['nombres', 'apellido', 'nro_doc', 'tipo_doc', 'matriculas.matricula']
    @result = Profesional.search(search_params[:termino_buscado], attributes)
    respond_to do |format|
      format.html
      format.csv { send_data Profesional.to_csv(@result), filename: "exportado_#{I18n.l(Time.now, format: :short).tr(" ","_")}.csv" }
    end
  end

  private
  def search_params
    params.permit(:termino_buscado, :nombre, :documento, :matricula, :format)
  end
end
