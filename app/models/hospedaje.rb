class Hospedaje < ActiveRecord::Base
  #belongs_to :tipo
  #has_many :tipo
  belongs_to :user
  validates :titulo, :presence => {:message => "Usted debe ingresar un título"}
  validates :foto, :presence => {:message => "Usted debe ingresar una foto"}
  validates :lugar, :presence => {:message => "Usted debe ingresar una ubicacion"}
  validates :fecha, :presence  => {:message => "Usted debe ingresar una fecha"}
  validates :capacidad, :presence => {:message => "Usted debe ingresar la capacidad del hospedaje"}
end
