class EvaluadoresController < ApplicationController
  before_action :set_evaluadore, only: [:show, :edit, :update, :destroy]

  # GET /evaluadores
  # GET /evaluadores.json
  def index
    @evaluadores = Evaluadore.all
  end

  # GET /evaluadores/1
  # GET /evaluadores/1.json
  def show
  end
  # GET /evaluadores/evaluar_proyecto
  def evaluar_proyecto
     @proyectos = Proyecto.all
  end

  # GET /evaluadores/new
  def new
    @evaluadore = Evaluadore.new
  end

  # GET /evaluadores/1/edit
  def edit
  end

  # POST /evaluadores
  # POST /evaluadores.json
  def create
    @evaluadore = Evaluadore.new(evaluadore_params)

    respond_to do |format|
      if @evaluadore.save
        format.html { redirect_to @evaluadore, notice: 'Evaluadore was successfully created.' }
        format.json { render :show, status: :created, location: @evaluadore }
      else
        format.html { render :new }
        format.json { render json: @evaluadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /evaluadores/1
  # PATCH/PUT /evaluadores/1.json
  def update
    respond_to do |format|
      if @evaluadore.update(evaluadore_params)
        format.html { redirect_to @evaluadore, notice: 'Evaluadore was successfully updated.' }
        format.json { render :show, status: :ok, location: @evaluadore }
      else
        format.html { render :edit }
        format.json { render json: @evaluadore.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /evaluadores/1
  # DELETE /evaluadores/1.json
  def destroy
    @evaluadore.destroy
    respond_to do |format|
      format.html { redirect_to evaluadores_url, notice: 'Evaluadore was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_evaluadore
      @evaluadore = Evaluadore.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def evaluadore_params
      params.require(:evaluadore).permit(:cedula, :apellido, :cedula, :titulo, :especializacion, :maestria, :doctorado, :universidad)
    end
end
