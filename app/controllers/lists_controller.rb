class ListsController < ApplicationController

def index
	lists = List.all
	render json: lists
end

def show
	list = List.find(params[:id])
	render json: list
end

def create
	list = List.new(list_parmas)
	list.save
	render json: list
end

def update
	list = List.find(params[:id])
	list.update(list_parmas)
	render json: list_parmas
end

def destroy
	list = List.find(params[:id])
	list.destroy
	render json: list
end

private

	def list_parmas
		params.require(:list).permit(:title)
	end
end
