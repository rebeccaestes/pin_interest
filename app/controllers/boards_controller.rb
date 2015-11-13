class BoardsController < ApplicationController

	before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
	before_action :set_post, only: [:show, :edit, :update, :destroy]

	def index
		@boards = Board.all
	end

	def new
		@user = current_user
		@board = Board.new
	end

	def create
		@user = current_user
		@board = Board.create!(board_params.merge(user: @user))
		redirect_to board_path(@board)
	end

	def show
		@user = @board.user
		@pins = @board.pins
	end

	def edit
		@user = @board.user
		if @user != current_user
			flash[:alert] = "Access denied! You can't edit someone else's pin."
			redirect_to root_path
		end
	end

	def update
		@user = current_user
		@board.update(board_params.merge(user: @user))
		redirect_to board_path(@board)
	end

	def destroy
		@board.destroy
		redirect_to boards_path
	end

	private
	def board_params
		params.require(:board).permit(:user_id, :title)
	end

	def set_post
		@board = Board.find(params[:id])
	end

end
