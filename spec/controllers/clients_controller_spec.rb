require 'rails_helper'

RSpec.describe ClientsController, type: :controller do

  let(:valid_attributes) { { name: "joão da Silva", cpf: "12305739456", email: "joao.silva@email.com" } }
  let(:invalid_attributes) { { name: "joão da Silva", cpf: nil, email: "joao.silva@email.com" } }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      client = Client.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      client = Client.create! valid_attributes
      get :show, params: {id: client.to_param}, session: valid_session
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
      client = Client.create! valid_attributes
      get :edit, params: {id: client.to_param}, session: valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Client" do
        expect {
          post :create, params: {client: valid_attributes}, session: valid_session
        }.to change(Client, :count).by(1)
      end

      it "redirects to the clients list" do
        post :create, params: {client: valid_attributes}, session: valid_session
        expect(response).to redirect_to(clients_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, params: {client: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) { { name: "Johnny da Silva" } }

      it "updates the requested client" do
        client = Client.create! valid_attributes
        put :update, params: {id: client.to_param, client: new_attributes}, session: valid_session
        client.reload
        expect(client.name).to eq(new_attributes[:name])
      end

      it "redirects to the clients list" do
        client = Client.create! valid_attributes
        put :update, params: {id: client.to_param, client: valid_attributes}, session: valid_session
        expect(response).to redirect_to(clients_path)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        client = Client.create! valid_attributes
        put :update, params: {id: client.to_param, client: invalid_attributes}, session: valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested client" do
      client = Client.create! valid_attributes
      expect {
        delete :destroy, params: {id: client.to_param}, session: valid_session
      }.to change(Client, :count).by(-1)
    end

    it "redirects to the clients list" do
      client = Client.create! valid_attributes
      delete :destroy, params: {id: client.to_param}, session: valid_session
      expect(response).to redirect_to(clients_url)
    end
  end

  describe "DELETE #delete_selected" do
    it "destroys the requested client" do
      client = Client.create! valid_attributes
      expect {
        delete :delete_selected, params: {clients: [client.to_param]}, session: valid_session
      }.to change(Client, :count).by(-1)
    end

    it "redirects to the clients list" do
      client = Client.create! valid_attributes
      delete :delete_selected, params: {clients: [client.to_param]}, session: valid_session
      expect(response).to redirect_to(clients_url)
    end
  end

end
