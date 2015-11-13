class PinsController < ApplicationController

	def index
		@pins = Pin.all
	end

	def new
		@pin = Pin.new
	end

	def create
		@pin = Pin.create(pin_params)
		redirect_to pin_path(@pin)
	end

	def show
		@pin = Pin.find(params[:id])
	end

	private
	def pin_params
		params.require(:pin).permit(:title, :img_url)
	end

end