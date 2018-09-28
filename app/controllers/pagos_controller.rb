class PagosController < ApplicationController
  before_action :set_pago, only: %i[show edit update destroy]
  #before_action :correct_user, only: %i[show index]
  before_action :admin_user, only: %i[update edit destroy]

  # GET /pagos
  # GET /pagos.json
  def index
    @pagos = Pago.where(profesional: params[:profesional_id]).order(:fecha_pago, :cuota_anio, :nro_recibo)
    @profesional = Profesional.find params[:profesional_id]
  end

  def reporte
    @title = 'Reporte pagos'
    # @pagos = Pago.all
    #
    # @p = Pago.find_by_sql("SELECT profesionales.* FROM pagos  inner join profesionales
    #                                       ON pagos.profesional_id=profesionales.id")
    # puts "variable: #{@p}"
    #
    # @pago1 = Pago.includes(:profesional).order(:nombres)
    #
    # @pago1.each do |pago|
    #   puts pago.profesional.nombres
    # end

    render layout: false
    # byebug
    # @pagos = Pago.joins(:profesional).merge(Profesional.order(apellido: :desc))
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
    @pago.fecha_pago = Date.today.strftime('%Y-%m-%d')
    @pago.cuota_anio = Date.today.year
    @pago.concepto = Choices['concepto'][0]
  end

  def new_mercado_pago
    @profesional = Profesional.find params[:profesional_id]

    require 'mercadopago.rb'
    $mp = MercadoPago.new(ENV['CLIENT_ID'], ENV['CLIENT_SECRET'])

    preference_data = {
      "items": [
        {
          "title": "prueba pago matricula #{@profesional.matricula.matricula}",
          "quantity": 1,
          "unit_price": 10.2,
          "currency_id": "ARS"
          }],
          "payer": {
            "name": "#{@profesional.nombres}",
            "surname": "#{@profesional.apellido}",
            "email": "",
            "date_created": "",
            "phone": {
              "area_code": "",
              "number": ""
            }
          }

    }
    @preference = $mp.create_preference(preference_data)

    #puts @preference
    # puts @preference[:sandbox_init_point]
    # result = JSON.parse(@preference.to_json)
    # byebug
    # redirect_to result['sandbox_init_point']
    redirect_to @preference['response']['init_point']
  end

      # GET /pagos/1/edit
      def edit
        @profesional = Profesional.find params[:profesional_id]
      end

      # POST /pagos
      # POST /pagos.json
      def create
        @pago = Pago.new(pago_params)
        if(current_user.admin?)
          @pago.status = Choices['status'][0]
        else
          @pago.status = Choices['status'][1]
        end

        if @pago.save
          flash[:success] = 'Pago creado exitosamente'
          redirect_to profesional_pagos_url(@pago.profesional)
        else
          flash[:danger] = 'No se pudo crear el Pago, revise los campos completado'
          @profesional = Profesional.find @pago.profesional_id
          render :new
        end
      end

      # PATCH/PUT /pagos/1
      # PATCH/PUT /pagos/1.json
      def update
        profesional_id = @pago.profesional
        if @pago.update(pago_params)
          flash[:success] = 'El pago se actualizó exitosamente'
          redirect_to profesional_pagos_url(profesional_id)
        else
          flash[:danger] = 'No se pudo actualizar el Pago'
          @profesional = Profesional.find @pago.profesional_id
          render 'edit'
        end
      end

      # DELETE /pagos/1
      # DELETE /pagos/1.json
      def destroy
        if @pago.destroy
          flash[:success] = 'El pago fue eliminado exitosamente'
        else
          flash[:danger] = 'No se pudo eliminar el Pago'
        end
        redirect_to profesional_pagos_url(@pago.profesional)
      end

      def general
        @pagos = Pago.all
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
          :profesional_id,
          :notas,
          :cuota_anio,
          :concepto,
          :status)
      end
    end
