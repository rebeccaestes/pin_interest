class PinsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

	def index
		@pins = Pin.all
	end

	def new
		@board = Board.find(params[:board_id])
		@user = @board.user
		@pin = Pin.new
		if @user != current_user
			flash[:alert] = "Access denied! You can't add a pin to someone else's board."
			redirect_to board_path(@board)
		end
	end

	def create
		@board = Board.find(params[:board_id])
		@pin = Pin.create!(pin_params.merge(board: @board))
		redirect_to board_path(@board)
	end

	def show
		@board = Board.find(params[:board_id])
		@pin = Pin.find(params[:id])
		@user = @board.user
	end

	def edit
		@board = Board.find(params[:board_id])
		@pin = Pin.find(params[:id])
		@user = @board.user
		if @user != current_user
			flash[:alert] = "Access denied! You can't edit someone else's pin."
			redirect_to board_pin_path(@board, @pin)
		end
	end

	def update
		@board = Board.find(params[:board_id])
		@user = @board.user
		@pin = Pin.find(params[:id])
		@pin.update(pin_params.merge(board: @board))
		redirect_to board_path(@board)
	end

	def destroy
		@pin = Pin.find(params[:id])
		@board = Board.find(params[:board_id])
		@pin.destroy
		redirect_to board_path(@board)
	end

	private
	def pin_params
		params.require(:pin).permit(:user_id, :title, :img_url)
	end

end
