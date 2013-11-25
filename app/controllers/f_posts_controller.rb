class FPostsController < ApplicationController
  before_filter :authenticate_user!, :admin_manage
  before_action :set_f_post, only: [:show, :edit, :update, :destroy]
  


  # GET /f_posts
  # GET /f_posts.json
  def index
      @f_posts = FPost.all
  end

  # GET /f_posts/1
  # GET /f_posts/1.json
  def show
    current_user.has_role? :admin
  end

  # GET /f_posts/new
  def new
    current_user.has_role? :admin
    @f_post = FPost.new
  end

  # GET /f_posts/1/edit
  def edit
    current_user.has_role? :admin
  end

  # POST /f_posts
  # POST /f_posts.json
  def create
    @f_post = FPost.new(f_post_params)

    respond_to do |format|
      if @f_post.save
        format.html { redirect_to @f_post, notice: 'F post was successfully created.' }
        format.json { render action: 'show', status: :created, location: @f_post }
      else
        format.html { render action: 'new' }
        format.json { render json: @f_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /f_posts/1
  # PATCH/PUT /f_posts/1.json
  def update
    respond_to do |format|
      if @f_post.update(f_post_params)
        format.html { redirect_to @f_post, notice: 'F post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @f_post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /f_posts/1
  # DELETE /f_posts/1.json
  def destroy
    current_user.has_role? :admin
    @f_post.destroy
    respond_to do |format|
      format.html { redirect_to f_posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_f_post
      @f_post = FPost.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def f_post_params
      params.require(:f_post).permit(:title, :desc, :sell_price, :base_price, :discount, :f_weigth, :add_stat, :detail)
    end
    
    
end
