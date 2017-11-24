class AddDecontToProyectos < ActiveRecord::Migration
  def change
    add_column :proyectos, :decont, :integer
  end
end
