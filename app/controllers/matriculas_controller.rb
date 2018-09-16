class MatriculasController < ApplicationController
  # GET /matriculas
  # GET /matriculas.json
  def index
    @matriculas = Matricula.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @matriculas }
    end
  end

  # GET /matriculas/1
  # GET /matriculas/1.json
  def show
    @matricula = Matricula.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @matricula }
    end
  end

  # GET /matriculas/new
  # GET /matriculas/new.json
  def new
    @matricula = Matricula.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @matricula }
    end
  end

  # GET /matriculas/1/edit
  def edit
    
    @matricula = Matricula.find(params[:id])
  end

  # POST /matriculas
  # POST /matriculas.json
  def create
    @matricula = Matricula.new(matricula_params)

    respond_to do |format|
      if @matricula.save
        format.html { redirect_to @matricula, notice: 'Matricula was successfully created.' }
        format.json { render json: @matricula, status: :created, location: @matricula }
      else
        format.html { render action: "new" }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /matriculas/1
  # PUT /matriculas/1.json
  def update
    @matricula = Matricula.find(params[:id])

    respond_to do |format|
      if @matricula.update_attributes(matricula_params)
        format.html { redirect_to @matricula, notice: 'Matricula was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @matricula.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /matriculas/1
  # DELETE /matriculas/1.json
  def destroy
    @matricula = Matricula.find(params[:id])
    @matricula.destroy

    respond_to do |format|
      format.html { redirect_to matriculas_url }
      format.json { head :no_content }
    end
  end

  private
  def matricula_params
    params.require(:matricula).permit(:especialidad, :estado, :fecha_habilitacion, :fecha_inscripcion, :fecha_vencimiento, :folio, :libro, :matricula, :nota_fecha_habilitacion, :notas, :profesional_id, :vencimiento)
  end
end
