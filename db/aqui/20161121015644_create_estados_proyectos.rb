class CreateEstadosProyectos < ActiveRecord::Migration
  def change
    create_table :estados_proyectos do |t|
      t.integer :proyecto_id
      t.integer :estado_id

      t.timestamps null: false
    end
  end
end
