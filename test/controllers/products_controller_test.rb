require 'test_helper'

class ProductsControllerTest < ActionController::TestCase
  setup do
    @product = products(:one)
    @update = {
      title:        "Lorem ipsum",
      description:  "Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eveniet, iusto quae eaque aut culpa quaerat saepe officiis soluta necessitatibus atque. Amet obcaecati porro error consequatur modi cum ipsum! Perferendis, deleniti.",
      image_url:    "lorem.jpg",
      price:        19.95
    }
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create product" do
    assert_difference('Product.count') do
      # post :create, product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title }
      post :create, product: @update
    end

    assert_redirected_to product_path(assigns(:product))
  end

  test "should show product" do
    get :show, id: @product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @product
    assert_response :success
  end

  test "should update product" do
    # patch :update, id: @product, product: { description: @product.description, image_url: @product.image_url, price: @product.price, title: @product.title }
    patch :update, id: @product, product: @update
    assert_redirected_to product_path(assigns(:product))
  end

  test "should destroy product" do
    assert_difference('Product.count', -1) do
      delete :destroy, id: @product
    end

    assert_redirected_to products_path
  end
end
