class ArticlesController < ApplicationController
=begin
 view
=end
  def index
    @articles = Article.all
  end

=begin
 view
=end
  def new
    @article = Article.new
  end

=begin
Action for new
=end
  def create
    logger.debug "request: #{params.inspect}"
    vari = params.require(:article).permit(:text, :title)
    logger.debug "SOLO LOS ARTICLES : #{vari}"
    @article = Article.new(vari)
    if @article.save
      redirect_to @article
    else
      render 'new'
    end
    logger.debug "New article: #{@article.attributes.inspect}"
    logger.debug "Article should be valid: #{@article.valid?}"
  end

=begin
	View.
=end
  def edit
    @article = Article.find(params[:id])
  end

=begin
	Action for update
=end
  def update
    @article = Article.find(params[:id])

    if @article.update(article_params)
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    logger.debug "********** DELETE *************"
    logger.debug "request: #{params.inspect}"
    vari = params.require(:id)
    logger.debug "SOLO LOS ARTICLES : #{vari}"
    Article.delete(vari)
    redirect_to action: "index"
  end


  def show
    @article = Article.find(params[:id])
  end

  private
  def article_params
    params.require(:article).permit(:title, :text)
  end


end