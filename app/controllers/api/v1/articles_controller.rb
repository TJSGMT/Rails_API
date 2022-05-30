class Api::V1::ArticlesController < ApplicationController 

  before_action :find_article, only: [:show, :edit, :update, :destroy]
  
  def index
    @articles = Article.all
    render json: @articles
  end

  def create
    @article = Article.new(article_params)
    if @article.save
      result = { type: "success", data: ActiveModelSerializers::SerializableResource.new(@article, each_serailizer: ArticleSerializer), message: ["Article Created Successfully"],status: 200 }
      render json: result
    else
      render json: "Something went terribl wrong"
    end  
  end

  def edit
    render json: @article
  end

  def update
    if @article.update(article_params)
      render json: @article
    else
      render json: "Somthing went Wrong"
    end
  end

  def show
    render json: @article.article_comments
  end

  def destroy
    if @article.destroy
      render json: "Successfully deleted"
    else
      render json: "Something went wrong"
    end
  end

  def searched
    @parameter = params[:title]
    @article = Article.where("lower(title) LIKE :title", title: "%#{@parameter}%")
    if @article != []
      render json: @article
    else
      render json: "record doesn't exist."
    end
  end

  private

  def find_article
    @article = Article.find(params[:id])
  end 

  def article_params
    params.permit(:title, :body, :release_date)
  end
end
