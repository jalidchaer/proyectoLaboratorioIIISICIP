class AddInvestigadorIdToProyectos < ActiveRecord::Migration
  def change
    add_column :proyectos, :investigador_id, :integer
  end
end
