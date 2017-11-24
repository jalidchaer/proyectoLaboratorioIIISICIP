class CreateJoinTableProyectoEvaluadores < ActiveRecord::Migration
  def change
    create_join_table :proyectos, :evaluadores do |t|
       t.index [:proyecto_id, :evaluadore_id]
       t.index [:evaluadore_id, :proyecto_id]
    end
  end
end
