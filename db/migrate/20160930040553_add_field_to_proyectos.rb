class AddFieldToProyectos < ActiveRecord::Migration
  def change
    add_column :proyectos, :filename, :string
    add_column :proyectos, :content_type, :string
    add_column :proyectos, :file_contents, :binary
  end
end
