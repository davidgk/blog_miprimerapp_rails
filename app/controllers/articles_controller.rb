class ArticlesController < ApplicationController
	  def index
      @articles = Article.all
    end

    def new
  	end

  	def create
        logger.debug "request: #{params.inspect}"
        vari =  params.require(:article).permit(:text, :title)
        logger.debug "SOLO LOS ARTICLES : #{vari}"
        @article = Article.new(vari)
        logger.debug "New article: #{@article.attributes.inspect}"
        logger.debug "Article should be valid: #{@article.valid?}"
        @article.save
		    redirect_to @article
  	end

    def destroy
        logger.debug "********** DELETE *************"
        logger.debug "request: #{params.inspect}"
        vari =  params.require(:id)
        logger.debug "SOLO LOS ARTICLES : #{vari}"
        Article.delete(vari)
        redirect_to action: "index"
    end


  	def show
  		 @article = Article.find(params[:id])
  	end

  	private 
  		def article_params
  			params[:article]
  		end 


end