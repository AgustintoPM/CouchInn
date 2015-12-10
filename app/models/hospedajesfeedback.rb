class Hospedajesfeedback < ActiveRecord::Base
	belongs_to :user
	validates :puntaje, presence:true
	validates :descripcion, presence:true
end
