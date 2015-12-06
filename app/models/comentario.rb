class Comentario < ActiveRecord::Base
  belongs_to :hospedaje
  belongs_to :user
end
