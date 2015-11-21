class Tipo < ActiveRecord::Base
	validates :nombre, presence:true
	validates_uniqueness_of :nombre, message:"Ya existe un tipo con este nombre."
	has_many :hospedajes
end
