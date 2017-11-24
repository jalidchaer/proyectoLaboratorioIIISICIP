class CreateUsuarios < ActiveRecord::Migration
  def change
    create_table :usuarios do |t|
      t.string :cedula
      t.string :usuario
      t.string :clave
      t.string :nivel
      t.date :fecharegistro

      t.timestamps null: false
    end
  end
end
