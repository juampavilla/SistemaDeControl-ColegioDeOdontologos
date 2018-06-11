class ReportesController < ApplicationController
  def index

    @title = "Reportes"
    redirect_back(fallback_location: reportes_path)
  end

end
