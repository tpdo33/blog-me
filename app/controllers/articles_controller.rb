class ArticlesController < ApplicationController 
	before_action :set_article, only: [:edit, :update, :show, :destroy]
	before_action :require_user, except: [:index, :show]
	before_action :require_same_user, only: [:edit, :update, :destory]

	# Grab all articles from database
	def index
		@articles =Article.paginate(:page => params[:page], :per_page => 5)
	end

	def show
	end

	def new
	end

	# create a new article
	def create	
		article = Article.new(article_params)
		article.user = current_user
		if article.valid?
			article.save
			flash[:success] = "Article was successfully created"
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
		@article.update(article_params)
			@article.save

		redirect_to "/articles/#{@article.id}"
	end

	# delete an article
	def destroy
		@article.destroy
		flash[:notice] = "Article was successfully deleted"
		redirect_to "/articles"
	end

	  private
	  	def article_params
	 		params.require(:article).permit(:title, :description)
	    end

	    def set_article
	    	@article = Article.find(params[:id])
	    end

	    def require_same_user
	    	if current_user != @article.user and !current_user.admin?
	    		flash[:danger] = "You can only edit or delete your own articles"
	    		redirect_to root_path
	    	end
	    end
end