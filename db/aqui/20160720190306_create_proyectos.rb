class CreateProyectos < ActiveRecord::Migration
  def change
    create_table :proyectos do |t|
      t.date :fecha
      t.string :codigo
      t.string :responsable
      t.string :titulo
      t.string :objetivogeneral
      t.string :objetivosespecifo
      t.string :resumen
      t.integer :duracion
      t.float :monto
      t.string :estado
      
    
      t.timestamps null: false
    end
  end
end
