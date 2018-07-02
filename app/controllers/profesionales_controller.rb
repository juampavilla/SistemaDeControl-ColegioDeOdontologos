class ProfesionalesController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update]
  before_action :admin_user,     only: :index

  def index
    # @profesionales = Profesional.all.order :id
    @profesionales = (Profesional.all.order :id ).paginate(page: params[:page])


    respond_to do |format|
      # format.html # index.html.erb
      format.json { render json: @profesionales }
      format.csv { send_data @profesionales.to_csv }
      format.html
    end
  end

  def reporte
    @profesionales = (Profesional.all.order :id )
    render layout: false
    respond_to do |format|
      format.html
      format.xlsx
    end
  end

  # GET /profesionales/1
  # GET /profesionales/1.json
  def show
    @profesional = Profesional.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @profesional }
    end
  end

  # GET /profesionales/1/domicilios
  # GET /profesionales/1/domicilios.json
  def show_domicilios
    @domicilios = Profesional.find(params[:profesional_id]).domicilios

    respond_to do |format|
      format.html # show_domicilios.html.erb
      format.json { render json: @domicilios }
    end
  end

  # GET /profesionales/new
  # GET /profesionales/new.json
  def new
    @profesional = Profesional.new
    @profesional.matricula = Matricula.new(profesional: @profesional)
    @profesional.domicilios << Domicilio.new(profesional: @profesional)
    @profesional.domicilios << Domicilio.new(profesional: @profesional)
    @profesional.domicilios << Domicilio.new(profesional: @profesional)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @profesional }
    end
  end

  # GET /profesionales/1/edit
  def edit
    @profesional = Profesional.find(params[:id])
    #@profesional.domicilios.sort_by(&:id)
  end

  # POST /profesionales
  # POST /profesionales.json
  def create
    @profesional = Profesional.new(profesional_params)

    respond_to do |format|
      if @profesional.save
        format.html { redirect_to @profesional, notice: 'Profesional was successfully created.' }
        format.json { render json: @profesional, status: :created, location: @profesional }
      else
        format.html { render action: "new" }
        format.json { render json: @profesional.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /profesionales/1
  # PUT /profesionales/1.json
  def update
    @profesional = Profesional.find(params[:id])

    respond_to do |format|
      if @profesional.update_attributes(profesional_params)
        format.html { redirect_to @profesional, notice: 'Profesional was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @profesional.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profesionales/1
  # DELETE /profesionales/1.json
  def destroy
    @profesional = Profesional.find(params[:id])
    @profesional.destroy

    respond_to do |format|
      format.html { redirect_to profesionales_url }
      format.json { head :no_content }
    end
  end

  private

  def profesional_params
    params.require(:profesional).permit(:apellido, :nombres, :tipo_doc, :nro_doc, :fecha_nacimiento, matricula_attributes: matricula_params, domicilios_attributes: domicilios_params)
  end

  def matricula_params
    [:id, :especialidad, :estado, :fecha_habilitacion, :fecha_inscripcion, :fecha_vencimiento, :folio, :libro, :matricula, :nota_fecha_habilitacion, :notas, :profesional_id, :vencimiento]
  end

  def domicilios_params
    [:id, :cp, :domicilio, :localidad, :notas, :profesional_id, :telefono, :tipo]
  end



  # Confirms a logged-in user.
  def logged_in_user
    unless logged_in?
      store_location
      flash[:danger] = 'Es necesario loguearse.'
      redirect_to login_url
    end
  end


    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
