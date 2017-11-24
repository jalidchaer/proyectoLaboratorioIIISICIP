class CreateEvaluadores < ActiveRecord::Migration
  def change
    create_table :evaluadores do |t|
      t.string :cedula
      t.string :apellido
      t.string :cedula
      t.string :titulo
      t.string :especializacion
      t.boolean :maestria
      t.boolean :doctorado
      t.string :universidad

      t.timestamps null: false
    end
  end
end
