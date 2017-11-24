class AddContToProyectos < ActiveRecord::Migration
  def change
    add_column :proyectos, :cont, :integer
  end
end
