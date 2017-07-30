class DomiciliosController < ApplicationController
  # GET /domicilios
  # GET /domicilios.json
  def index
    @domicilios = Domicilio.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @domicilios }
    end
  end

  # GET /domicilios/1
  # GET /domicilios/1.json
  def show
    @domicilio = Domicilio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @domicilio }
    end
  end

  # GET /domicilios/new
  # GET /domicilios/new.json
  def new
    @domicilio = Domicilio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @domicilio }
    end
  end

  # GET /domicilios/1/edit
  def edit
    @domicilio = Domicilio.find(params[:id])
  end

  # POST /domicilios
  # POST /domicilios.json
  def create
    @domicilio = Domicilio.new(domicilio_params)

    respond_to do |format|
      if @domicilio.save
        format.html { redirect_to @domicilio, notice: 'Domicilio was successfully created.' }
        format.json { render json: @domicilio, status: :created, location: @domicilio }
      else
        format.html { render action: "new" }
        format.json { render json: @domicilio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /domicilios/1
  # PUT /domicilios/1.json
  def update
    @domicilio = Domicilio.find(params[:id])

    respond_to do |format|
      if @domicilio.update_attributes(domicilio_params)
        format.html { redirect_to @domicilio, notice: 'Domicilio was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @domicilio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /domicilios/1
  # DELETE /domicilios/1.json
  def destroy
    @domicilio = Domicilio.find(params[:id])
    @domicilio.destroy

    respond_to do |format|
      format.html { redirect_to domicilios_url }
      format.json { head :no_content }
    end
  end

  private
  def domicilio_params
    params.require(:domicilio).permit(:cp, :domicilio, :localidad, :notas, :profesional_id, :telefono, :tipo)
  end
end
