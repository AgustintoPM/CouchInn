class Hospedaje < ActiveRecord::Base
  belongs_to :tipo
  belongs_to :user
  validates :titulo, presence:true
  validates :foto, presence:true
  validates :lugar, presence:true
  validates :fecha, presence:true
  validates :capacidad, presence:true
  belongs_to :tipos
end
