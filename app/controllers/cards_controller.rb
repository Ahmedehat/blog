class CardsController < ApplicationController

def index
	list = List.find(params[:list_id])
	cards = list.cards
	render json: cards
end

def show
	card = Card.find(params[:id])
	render json: card
end

def create
	list = List.find(params[:list_id])
	card = list.cards.new(card_params)
	if card.save
		render json: card
	else
		render  json: card.errors
	end
end

def update
	card = Card.find(params[:id])
	if card.update(card_params)
		render json: card_params
	else
		render json: card.errors
	end
end

def destroy
	card = Card.find(params[:id])
	card.destroy
	render json: card
end





private
	def set_list
		@list = List.find(params[:list_id])
		render json: "list not found" if @list.nil?
	end

	def card_params
		params.require(:card).permit(:title , :description)
	end

end
