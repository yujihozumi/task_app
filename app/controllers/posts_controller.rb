class PostsController < ApplicationController
  def index
    @posts = Post.all
    @post = Post.find_by(id: params[:id])
    @post_count = Post.all.count
    
  end
  
  
  def new
    @post = Post.new
    @post_count = Post.all.count
  end
 
  def create
    @post = Post.new(params.require(:post).permit(:title, :start_at, :stop_at, :allday, :test1, :postmemo))
    if @post.save
      flash[:notice] = "スケジュールを登録しました"
      redirect_to :posts
    else
      render "new"
    end
    
  end
 
  def show
    @post = Post.find(params[:id])
    @post_count = Post.all.count
  end
 
  def edit
    @post = Post.find(params[:id])
    @post_count = Post.all.count
  end
 
  def update
    @post = Post.find(params[:id])
    if @post.update(params.require(:post).permit(:title, :start_at, :stop_at, :allday, :test1, :postmemo))
      flash[:notice] = "スケジュールを更新しました"
      redirect_to :posts
    else
      render "edit"
    end
  end
 
  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "スケジュールを削除しました"
    redirect_to :posts
  end
  
end
