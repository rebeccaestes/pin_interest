class PinsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@pins = Pin.all
	end

	def new
		@user = current_user
		@pin = Pin.new
	end

	def create
		@user = current_user
		@pin = Pin.create!(pin_params.merge(user: @user))
		redirect_to pin_path(@pin)
	end

	def show
		@user = @pin.user
	end

	def edit
		@user = @pin.user
		if @user != current_user
			flash[:alert] = "Access denied! You can't edit someone else's pin."
			redirect_to root_path
		end
	end

	def update
		@user = current_user
		@pin.update(pin_params.merge(user: @user))
		redirect_to pin_path(@pin)
	end

	def destroy
		@pin.destroy
		redirect_to pins_path
	end

	private
	def pin_params
		params.require(:pin).permit(:user_id, :title, :img_url)
	end

	def set_post
		@pin = Pin.find(params[:id])
	end

end