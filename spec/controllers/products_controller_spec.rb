require 'rails_helper'


RSpec.describe ProductsController, type: :controller do

  let(:valid_attributes) { { name: "Leite em pó", barcode: "123123", value: 1.99 } }

  let(:invalid_attributes) { { name: "Leite em pó", barcode: nil, value: 1.99 } }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :show, params: {id: product.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      product = Product.create! valid_attributes
      get :edit, params: {id: product.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Product" do
        expect {
          post :create, params: {product: valid_attributes}, session: valid_session
        }.to change(Product, :count).by(1)
      end

      it "redirects to the products list" do
        post :create, params: {product: valid_attributes}, session: valid_session
        expect(response).to redirect_to(products_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {product: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { value: 2.15 } }

      it "updates the requested product" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: new_attributes}, session: valid_session
        product.reload
        expect(product.value).to eq(new_attributes[:value])
      end

      it "redirects to the products list" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: valid_attributes}, session: valid_session
        expect(response).to redirect_to(products_url)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        product = Product.create! valid_attributes
        put :update, params: {id: product.to_param, product: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested product" do
      product = Product.create! valid_attributes
      expect {
        delete :destroy, params: {id: product.to_param}, session: valid_session
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete :destroy, params: {id: product.to_param}, session: valid_session
      expect(response).to redirect_to(products_url)
    end
  end


  describe "DELETE #delete_selected" do
    it "destroys the requested client" do
      product = Product.create! valid_attributes
      expect {
        delete :delete_selected, params: {products: [product.to_param]}, session: valid_session
      }.to change(Product, :count).by(-1)
    end

    it "redirects to the products list" do
      product = Product.create! valid_attributes
      delete :delete_selected, params: {products: [product.to_param]}, session: valid_session
      expect(response).to redirect_to(products_url)
    end
  end

end
