class AddAttachmentPlantillaToProyectos < ActiveRecord::Migration
  def self.up
    change_table :proyectos do |t|
      t.attachment :plantilla
    end
  end

  def self.down
    remove_attachment :proyectos, :plantilla
  end
end
