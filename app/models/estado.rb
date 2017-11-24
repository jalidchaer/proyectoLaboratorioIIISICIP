class Estado < ActiveRecord::Base
	has_and_belongs_to_many :proyectos , dependent: :destroy
end
