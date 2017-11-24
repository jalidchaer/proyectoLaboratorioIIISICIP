class AddProyectoidToEvaluacions < ActiveRecord::Migration
  def change
    add_column :evaluacions, :proyecto_id, :integer
  end
end
