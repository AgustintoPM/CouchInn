class CreditCard < ActiveRecord::Base
	belongs_to: user
	validates :fullnumber,presence: true, numericality: { only_integer: true}, length: { is: 16 }
	validates :name, presence: true, length: {maximum: 51}										
	validates :lastfourdigit,presence: true, numericality: {only_integer: true}, length: { is: 4 }
	validates :adress, presence: true, length: {maximum: 51}
	validates :phone, presence: true, numericality: {only_integer: true}

end
