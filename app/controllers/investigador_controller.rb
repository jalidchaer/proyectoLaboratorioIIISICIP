class InvestigadorController < ApplicationController
  def index
     investigador=current_user.id
     @proyectos = Proyecto.where(investigador_id: investigador).all
  end
  def show
    @proyecto = Proyecto.find(params[:id])
  end


  def registrar_proyecto
  	
  end

  def mostrar_proyectos
       @current_usuario ||= User.find(session[:user_id]) if session[:user_id]
    
    @proyectos= Proyecto.where(:investigador_id => @current_usuario.id).all
    
  end


   def create_proyecto2
    @proyecto = Proyecto.new(proyecto_params)
    @current_usuario ||= User.find(session[:user_id]) if session[:user_id]

    respond_to do |format|
       if @proyecto.save
        format.html { redirect_to @proyecto, notice: 'Proyecto creado exitosamente.' }
        format.json { render :show, status: :created, location: @proyecto}
      else
        format.html { render :new }
        format.json { render json: @proyecto.errors, status: :unprocessable_entity }
      end
    end
  end


  


=begin 
  def create
          @photo = Photo.new(photo_params)
          uploaded_io = params[:photo][:photo]
          File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
             file.write(uploaded_io.read)
           end
          if @photo.save
            flash[:success] = "The photo was added!"
            redirect_to root_path
          else
            render 'new'
          end
  end



def upload
  uploaded_io = params[:person][:picture]
 File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end
end
=end


  def create_proyecto
  #  uploaded_file = params[:file]
#file_content = uploaded_file.read
#puts "file_content"
  
  @proyecto = Proyecto.new(proyecto_params)
  
    @current_usuario ||= User.find(session[:user_id]) if session[:user_id]
    
        
       
        @proyecto.save
         @estado_proyecto = EstadosProyecto.new(:proyecto_id => @proyecto.id, :estado_id =>1)
        @estado_proyecto.save
      if @proyecto.save
        @proyecto.update_attribute(:investigador_id,@current_usuario.id)
        @proyecto.update_attribute(:estado,"asignacion")
        @proyecto.update_attribute(:cont,0)
        @proyecto.update_attribute(:decont,3)
       
        #Investigador.find(@current_usuario.id).update_attribute(:proyecto_id, @proyecto.id) 
      #Proyecto.find(@proyecto.id).update_attribute(:investigador_id, @current_usuario.id) 
        #Investigador.find(@current_usuario.id)


      

    	@correo = @current_usuario.correo
      @current_usuario.enviar_mensaje()# lo comente para no recibir spam de mensajes xD
        
        flash[:info] = "proyecto registrado exitosamente."
        redirect_to "/mostrar_proyectos"
       
      else
        
        render '/registrar_proyecto'
      end
  end


=begin  def create
    
    @cuestionario_tipo_frustracion = CuestionarioTipoFrustracion.new(cuestionario_tipo_frustracion_params)
    
    if @cuestionario_tipo_frustracion.save
       
     CuestionarioTipoFrustracion.find(@cuestionario_tipo_frustracion.id).update_attribute(:paciente_id, @cuestionario_tipo_frustracion.cedula) 
     Paciente.find(@cuestionario_tipo_frustracion.cedula).update_attribute(:cuestionario_tipo_frustracion_id, @cuestionario_tipo_frustracion.id) 
      flash[:success] = "Cuestionario registrado exitosamente"
      redirect_to '/mostrar_todos'
    else
  render 'cuestionario_tipo_frustracion'
      #redirect_to '/signup'
    end
  end
=end
  def destroy
    @proyecto.destroy
    respond_to do |format|
      format.html { redirect_to proyectos_url, notice: 'Documento eliminado.' }
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
      params.require(:proyecto).permit(:responsable,:codigo, :titulo, :objetivogeneral,:duracion, :plantilla)
    end
end
