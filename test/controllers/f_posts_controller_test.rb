require 'test_helper'

class FPostsControllerTest < ActionController::TestCase
  setup do
    @f_post = f_posts(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:f_posts)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create f_post" do
    assert_difference('FPost.count') do
      post :create, f_post: { add_stat: @f_post.add_stat, base_price: @f_post.base_price, desc: @f_post.desc, detail: @f_post.detail, discount: @f_post.discount, f_weigth: @f_post.f_weigth, sell_price: @f_post.sell_price, title: @f_post.title }
    end

    assert_redirected_to f_post_path(assigns(:f_post))
  end

  test "should show f_post" do
    get :show, id: @f_post
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @f_post
    assert_response :success
  end

  test "should update f_post" do
    patch :update, id: @f_post, f_post: { add_stat: @f_post.add_stat, base_price: @f_post.base_price, desc: @f_post.desc, detail: @f_post.detail, discount: @f_post.discount, f_weigth: @f_post.f_weigth, sell_price: @f_post.sell_price, title: @f_post.title }
    assert_redirected_to f_post_path(assigns(:f_post))
  end

  test "should destroy f_post" do
    assert_difference('FPost.count', -1) do
      delete :destroy, id: @f_post
    end

    assert_redirected_to f_posts_path
  end
end
