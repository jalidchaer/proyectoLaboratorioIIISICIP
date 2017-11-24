class CreateInvestigadors < ActiveRecord::Migration
  def change
    create_table :investigadors do |t|
      t.string :cedula
      t.integer :proyecto_id



      t.timestamps null: false
    end
    
  end
end
