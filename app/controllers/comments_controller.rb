class CommentsController < ApplicationController
  include SessionHelper
  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.json
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.json
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(params[:comment])
    @comment.user = current_user
    @comment.blog =Blog.find(session[:current_blog])
    
    respond_to do |format|
      if @comment.save
        format.html { redirect_to Blog.find(session[:current_blog]), notice: 'Comment was successfully created.' }
      else
        format.html { render Blog.find(session[:current_blog]) }
      end
    end
  end

  def update
    Comment.find(params[:id]).update_attribute("status","1")
    redirect_to :back
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end
end
