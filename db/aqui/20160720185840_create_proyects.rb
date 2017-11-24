class CreateProyects < ActiveRecord::Migration
  def change
    create_table :proyects do |t|
      t.date :fecha
      t.string :codigo
      t.string :responsable
      t.string :titulo
      t.string :objetivogeneral
      t.string :objetivosespecifo
      t.string :resumen
      t.integer :duracion
      t.float :monto
     

      t.timestamps null: false
    end
  end
end
