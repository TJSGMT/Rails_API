class Api::V1::ArticleCommentsController < ApplicationController 

  before_action :set_article_comment, only: [:show, :edit, :update, :destroy]
  
  def index
    @Article_Comments = ArticleComment.all
    render json: @Article_Comments
  end

    def create
      @Article_comment = ArticleComment.new(article_comment_params)
    if @Article_comment.save
      result = {type: "success", data: ActiveModelSerializers::SerializableResource.new(@Article_comment, each_serializer: ArticleCommentSerializer), meassage: ["Comment is cretaed "], status: 200}
      render json: result
    else
      render json: "Something went terrible wrong"
    end
  end

  def edit
    render json: @Article_comment
  end

  def update
    if @Article_comment.update(article_comment_params)
      render json: @Article_comment
    else
      render json: "Somthing went Wrong"
    end
  end

  def show
    render json: @Article_comment
  end

  def destroy
    if @Article_comment.destroy
      render json: "Successfully deleted"
    else
      render json: "Something went Wrong"
    end
  end

  def comment_search
    @parameter = params[:comment]
    @comment = ArticleComment.where("lower(comment) LIKE :comment", comment: "%#{@parameter}%")
    if @comment != []
      render json: @comment
    else
      render json: "record doesn't exist."
    end
  end

  private

  def set_article_comment
    @Article_comment = ArticleComment.find(params[:id])
  end

  def article_comment_params
    params.permit(:comment, :date_of_comment, :article_id)
  end
end
