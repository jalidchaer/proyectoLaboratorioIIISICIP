class EstadosProyecto < ActiveRecord::Base
	has_many :proyectos 
	has_many :estados
end
