class HospedajesController < ApplicationController
	def show
		@hospedaje = Hospedaje.find(params[:id])
	end
end