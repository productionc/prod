class BlogsController < ApplicationController
 def index
    @blogs = Blog.order("created_at DESC")
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(article_params)
    if @blog.save
      redirect_to blogs_path, notice: "Blog has been successfully created."
    else
      render action: "new"
    end
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update_attributes(article_params)
      redirect_to blogs_path, notice: "Blog has been successfully updated."
    else
      render action: "edit"
    end
  end

private

  def article_params
    params.require(:blog).permit(:title, :body)
  end
end
