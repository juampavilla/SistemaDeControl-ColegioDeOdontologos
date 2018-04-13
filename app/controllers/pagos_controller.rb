class PagosController < ApplicationController
  before_action :set_pago, only: %i[show edit update destroy]

  # GET /pagos
  # GET /pagos.json
  def index
    @pagos = Pago.where profesional: params[:profesional_id]
    @profesional = Profesional.find params[:profesional_id]
  end

  # GET /pagos/1
  # GET /pagos/1.json
  def show
    @pago = Pago.find params[:id]

    @profesional = Profesional.find @pago.profesional_id
  end

  # GET /pagos/new
  def new
    @profesional = Profesional.find params[:profesional_id]
    @pago = Pago.new(profesional_id: @profesional.id)
  end

  # GET /pagos/1/edit
  def edit; end

  # POST /pagos
  # POST /pagos.json
  def create
    @pago = Pago.new(pago_params)

    respond_to do |format|
      if @pago.save
        #  redirect_to @pago
        format.html { redirect_to profesional_pagos_url(@pago.profesional), notice: 'Pago was successfully created.' }
        format.json { render :show, status: :created, location: @pago }
      else
        format.html { render :new }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pagos/1
  # PATCH/PUT /pagos/1.json
  def update
    respond_to do |format|
      if @pago.update(pago_params)
        format.html { redirect_to profesional_pagos_url(@pago.profesional), notice: 'Pago was successfully updated.' }
        format.json { render :show, status: :ok, location: @pago }
      else
        format.html { render :edit }
        format.json { render json: @pago.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pagos/1
  # DELETE /pagos/1.json
  def destroy
    if @pago.destroy
      flash[:success] = '¡El pago fue eliminado exitosamente!'
      redirect_to profesional_pagos_url(@pago.profesional)
    else
      flash[:danger] = '¡No se pudo eliminar el Pago!'
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pago
    @pago = Pago.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pago_params
    params.require(:pago).permit(:monto_abonado,
                                 :fecha_pago,
                                 :nro_recibo,
                                 :profesional_id)
  end
end
