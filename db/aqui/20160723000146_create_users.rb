class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	  t.string :correo
      	t.string :password_digest
      	t.string :nombre
      	t.string :apellido
      	t.integer :rol


      t.timestamps null: false
    end
  end
end
