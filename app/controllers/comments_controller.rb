class CommentsController < ApplicationController
	def index
		card = Card.find(params[:card_id])
		comments = card.comments
		render json: comments
	end

	def show
		comment = Comment.find(params[:id])
		render json: comment
	end

	def create
		card = Card.find(params[:card_id])
		comment = card.comments.new(comment_parms)
		if comment.save
			render json: comment
		else
			render json: comment.errors
		end
	end

	def update
		comment = Comment.find(params[:id])
		if comment.update(comment_parms)
			render json: comment
		else
			render json comment.errors
		end
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		render json: comment
	end

private

	def set_card
		@card = Card.find(params[:card_id])
		render json: "card not found" if @card.nil?
	end

	def comment_parms
		params.require(:comment).permit(:content)
	end
end
