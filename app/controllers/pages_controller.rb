class PagesController < ApplicationController

  def home
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def reportes
    @title = "Reportes"
    
  end

  def pagos_reporte
    @title = "Reporte pagos"
    render layout: false
  end

end
