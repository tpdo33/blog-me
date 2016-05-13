class ArticlesController < ApplicationController

	# Grab all articles from database
	def index
		@articles = Article.all
	end


	def show
		@article =Article.find(params[:id])
	end

	def new
	end

	# create a new article
	def create	
		article = Article.new(article_params)
		if article.valid?
			article.save
		else
			flash[:errors] = article.errors.full_messages
		end
		redirect_to "/articles/#{article.id}"
	 end

	def edit
		@article = Article.find(params[:id])
	end

	
	#update article 
	def update
		@article = Article.find(params[:id])
		@article.update(article_params)
			@article.save

		redirect_to "/articles/#{@article.id}"
	end

	# delete an article
	def destroy
		@article = Article.find(params[:id])
		@article.destroy
		flash[:notice] = "Article was successfully deleted"
		redirect_to "/articles"
	end

	  private
	  	def article_params
	 		params.require(:article).permit(:title, :description)
	    end
end