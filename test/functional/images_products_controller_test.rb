require 'test_helper'

class ImagesProductsControllerTest < ActionController::TestCase
  setup do
    @images_product = images_products(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:images_products)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create images_product" do
    assert_difference('ImagesProduct.count') do
      post :create, images_product: { image_id: @images_product.image_id, product_id: @images_product.product_id }
    end

    assert_redirected_to images_product_path(assigns(:images_product))
  end

  test "should show images_product" do
    get :show, id: @images_product
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @images_product
    assert_response :success
  end

  test "should update images_product" do
    put :update, id: @images_product, images_product: { image_id: @images_product.image_id, product_id: @images_product.product_id }
    assert_redirected_to images_product_path(assigns(:images_product))
  end

  test "should destroy images_product" do
    assert_difference('ImagesProduct.count', -1) do
      delete :destroy, id: @images_product
    end

    assert_redirected_to images_products_path
  end
end
