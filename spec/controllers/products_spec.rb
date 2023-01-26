require 'rails_helper'

RSpec.describe ProductsController, type: :controller do

  describe "GET#index" do
    context "assigns all products to @products" do 
      it "if user is admin assigns all products to @products" do
        sign_in(create(:user, :admin))
        product = create(:product)
        get :index
        expect(assigns(:products)).to eq([product])


      end
    end
  end

  describe "GET#show" do
    context "assign product to @product" do
      it "if user is admin assign product to @product" do
        sign_in(create(:user, :admin))
        product = create(:product)
        get :show, params: { id: product.id}
        expect(assigns(:product)).to eq(product)
      end
    end
  end

  describe "GET#new" do
    context "assigns new product to @product" do 
      it "if user is admin assing new product to @product" do
        sign_in(create(:user, :admin))
        get :new
        expect(assigns(:product)).to be_a_new(Product)
      end
    end
  end

  describe "POST#create" do 
    context "create a new product" do
      it "if user is admin create a new product" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { product: attributes_for(:product) } }.to change(Product, :count).by(1)
      end
    end
  end
end