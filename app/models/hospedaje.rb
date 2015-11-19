class Hospedaje < ActiveRecord::Base
  validates :titulo, presence:true
  validates :foto, presence:true
  validates :lugar, presence:true
  validates :fecha, presence:true
  validates :capacidad, presence:true
    
end
