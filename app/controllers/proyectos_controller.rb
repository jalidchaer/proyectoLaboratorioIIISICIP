class ProyectosController < ApplicationController
  #before_action :set_proyecto, only: [:show, :edit, :update, :destroy]

  # GET /proyectos
  # GET /proyectos.json
  def index

    investigador=current_user.id
    @proyectos = Proyecto.where(investigador_id: investigador).all
  end

  # GET /proyectos/1
  # GET /proyectos/1.json
  def show
  
  @proyecto = Proyecto.find(params[:id])

  end

  # GET /proyectos/new
  def new
    
    @proyecto = Proyecto.new
  end

  # GET /proyectos/1/edit
  def edit
    
    @proyecto = Proyecto.find(params[:id])
  end

  # POST /proyectos
  # POST /proyectos.json
=begin
      if @proyecto.save
        format.html { redirect_to @proyecto, notice: 'Proyecto creado exitosamente.' }
        format.json { render :show, status: :created, location: @proyecto }
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end
=end

   def create2
   
  #  uploaded_file = params[:file]
#file_content = uploaded_file.read
#puts "file_content"

  @proyecto = Proyecto.new(proyecto_params)
    @current_usuario ||= User.find(session[:user_id]) if session[:user_id]
    
      if @proyecto.save
        @proyecto.update_attribute(:investigador_id,@current_usuario.id)
        #Investigador.find(@current_usuario.id).update_attribute(:proyecto_id, @proyecto.id) 
      #Proyecto.find(@proyecto.id).update_attribute(:investigador_id, @current_usuario.id) 
        #Investigador.find(@current_usuario.id)


      

      @correo = @current_usuario.correo
      @current_usuario.enviar_mensaje()# lo comente para no recibir spam de mensajes xD
        
        flash[:info] = "proyecto registrado exitosamente."
        redirect_to proyecto_path
       
      else
        
        render 'registrar_proyecto'
      end
  end

  def create
    @proyecto = Proyecto.new(proyecto_params)
     @proyecto.update_attribute(:investigador_id,@current_usuario.id)
    respond_to do |format|
      if @proyecto.save
        format.html { redirect_to proyectos_path, notice: 'Documento subido exitosamente.' }
        format.json { render action: 'show', status: :created, location: @proyecto }
      else
        format.html { render action: 'new' }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end


  # PATCH/PUT /proyectos/1
  # PATCH/PUT /proyectos/1.json
  def update

    @proyecto =  Proyecto.find (params[:id])
    respond_to do |format|
      if @proyecto.update(proyecto_params)
        @proyecto.update_attribute(:estado,"Evaluacion")
        
        @estado_proyecto = EstadosProyecto.new(:proyecto_id => @proyecto.id, :estado_id =>2)
        @estado_proyecto.save
        format.html { redirect_to @proyecto, notice: 'Proyecto actualizado exitosamente.' }
        format.json { render :show, status: :ok, location: @proyecto}
      else
        format.html { render :edit }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end

  def registrar_proyecto
    
  end

  

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
     @proyecto =  Proyecto.find (params[:id])
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to '/mostrar_proyectos', notice: 'Documento eliminado.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_proyecto
      @proyecto = Proyecto.find(params[:id])
    end



    # Never trust parameters from the scary internet, only allow the white list through.
    def proyecto_params
      #params.require(:proyecto).permit(:fecha, :codigo, :responsable, :titulo, :objetivogeneral, :objetivosespecifo, :resumen, :duracion, :monto, :estado)
      #params.require(:proyecto).permit(:codigo, :titulo, :objetivogeneral,:duracion,:responsable,:estado, evaluadore_ids:[], :plantilla)
       params.require(:proyecto).permit(:codigo, :titulo, :objetivogeneral,:duracion, :plantilla,:responsable, estado_ids:[])
    end
end
