# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OrdersController, type: :controller do
  let(:client) { Client.create!(name: 'Joca Cunha', cpf: '21345621345', email: 'joca@email.com') }
  let(:product) { Product.create!(name: 'Leite Parmalat 1l', barcode: '21345621345', value: 4.5) }

  let(:valid_attributes)   { { client_id: client.id, date: Date.today, discount: 0, product_orders_attributes: [product_id: product.id, quantity: 2] } }
  let(:invalid_attributes) { { client_id: client.id, date: nil, discount: 0, product_orders_attributes: [product_id: product.id, quantity: 2] } }

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      order = Order.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      order = Order.create! valid_attributes
      get :show, params: { id: order.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      order = Order.create! valid_attributes
      get :edit, params: { id: order.to_param }, session: valid_session
      expect(response).to be_success
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Order' do
        expect do
          post :create, params: { order: valid_attributes }, session: valid_session
        end.to change(Order, :count).by(1)
      end

      it 'redirects to the orders list' do
        post :create, params: { order: valid_attributes }, session: valid_session
        expect(response).to redirect_to(orders_url)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: { order: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) { { discount: 20 } }

      it 'updates the requested order' do
        order = Order.create! valid_attributes
        put :update, params: { id: order.to_param, order: new_attributes }, session: valid_session
        order.reload
        expect(order.discount).to eq(new_attributes[:discount])
      end

      it 'redirects to the orders list' do
        order = Order.create! valid_attributes
        put :update, params: { id: order.to_param, order: valid_attributes }, session: valid_session
        expect(response).to redirect_to(orders_url)
      end
    end

    context 'with invalid params' do
      it "returns a success response (i.e. to display the 'edit' template)" do
        order = Order.create! valid_attributes
        put :update, params: { id: order.to_param, order: invalid_attributes }, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested order' do
      order = Order.create! valid_attributes
      expect do
        delete :destroy, params: { id: order.to_param }, session: valid_session
      end.to change(Order, :count).by(-1)
    end

    it 'redirects to the orders list' do
      order = Order.create! valid_attributes
      delete :destroy, params: { id: order.to_param }, session: valid_session
      expect(response).to redirect_to(orders_url)
    end
  end

  describe 'DELETE #delete_selected' do
    it 'destroys the requested order' do
      order = Order.create! valid_attributes
      expect do
        delete :delete_selected, params: { orders: [order.to_param] }, session: valid_session
      end.to change(Order, :count).by(-1)
    end

    it 'redirects to the orders list' do
      order = Order.create! valid_attributes
      delete :delete_selected, params: { orders: [order.to_param] }, session: valid_session
      expect(response).to redirect_to(orders_url)
    end
  end
end
