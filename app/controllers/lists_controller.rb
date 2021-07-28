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
	if list.save
		render json: list
	else
		render json: list.errors
	end
end

def update
	list = List.find(params[:id])
	if list.update(list_parmas)
		render json: list_parmas
	else
		render json: list.errors
	end
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
