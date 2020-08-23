class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :set_categories, only: [:create, :edit, :new, :update]

  def index
    @pagy, @posts = pagy(Post.all)
    @categories_with_posts = Category.with_posts
  end

  def show
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)
    
    categories_params['categories'].reject(&:empty?).each do |category_id|
      category = Category.find(category_id.to_i)
      @post.categories << category
    end

    if @post.save
      redirect_to @post, notice: 'Post was successfully created.'
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    def set_categories
      @categories = Category.all
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:title, :subtitle, :author, :featured_image, :content)
    end

    def categories_params
      params.require(:post).permit(categories: [])
    end
end
