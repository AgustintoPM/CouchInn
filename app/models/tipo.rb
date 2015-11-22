class Tipo < ActiveRecord::Base
  has_many :hospedajes
	validates :nombre, presence:true
	validates_uniqueness_of :nombre, message:"Ya existe un tipo con este nombre."
end
