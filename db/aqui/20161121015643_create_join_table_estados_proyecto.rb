class CreateJoinTableEstadosProyecto < ActiveRecord::Migration
  def change
    create_join_table :proyectos, :estados do |t|
      # t.index [:proyecto_id, :estado_id]
      # t.index [:estado_id, :proyecto_id]
    end
  end
end
