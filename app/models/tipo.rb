class Tipo < ActiveRecord::Base
	validates :nombre, presence:true
end
