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

      it "redirects to root and displays flash message if user is not admin" do
        sign_in(create(:user))
        product = create(:product)
        get :index
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not allowed visit this page")
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

      it "redirects to root and displays flash message if user is not admin" do
        sign_in(create(:user))
        product = create(:product)
        get :show, params: { id: product.id}
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not allowed visit this page")
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

      it "redirects to root and displays flash message if user is not admin" do
        sign_in(create(:user))
        get :new
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
    end
  end

  describe "POST#create" do 
    context "with valid params and log in as admin" do
      it "should create new product" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { product: attributes_for(:product) } }.to change(Product, :count).by(1)
      end

      it "should redirect to created product" do
        sign_in(create(:user, :admin))
        post :create, params: { product: attributes_for(:product)}
        expect(response).to redirect_to(Product.last)
      end
    end

    context "with valid params and log in as user" do
      it "redirects to root and displays flash message if user is not admin" do
        sign_in(create(:user))
        post :create, params: { product: attributes_for(:product) }
        expect(response).to redirect_to(root_path)
        expect(flash[:alert]).to eq("You are not allowed visit this page")
      end
    end

    context "with invalid params and log in as admin" do
      it "doesn't create a new product on DB" do
        sign_in(create(:user, :admin))
        expect { post :create, params: { product: attributes_for(:product, :invalid) } }.to_not change(Product, :count)
      end

      it "should redirect to new template" do
        sign_in(create(:user, :admin))
        post :create, params: { product: attributes_for(:product, :invalid) }
        expect(response).to render_template(:new)
      end
    end
  end

end