require 'spec_helper'

describe Api::DreamsController do
  let!(:dream) { Dream.create(name: "It's my dream") }

  describe 'GET :index' do
    it 'should be success' do
      get :index, format: :json
      response.should be_success
    end
  end

  describe 'POST :create' do
    it 'creates new dream' do
      expect {
        post :create, format: :json, dream: {name: 'New dream'}
      }.to change(Dream, :count).by(1)
    end

    it 'responses created' do
      post :create, format: :json, dream: {name: 'New dream'}
      response.status.should == 201
    end
  end

  describe 'PUT :update' do
    it 'updates dream' do
      put :update, format: :json, id: dream.id, dream: {name: 'Updated dream'}
      dream.reload.name.should == 'Updated dream'
    end

    it 'response no content' do
      put :update, format: :json, id: dream.id, dream: dream.attributes
      response.status.should == 204
    end
  end

  describe 'DELETE :destroy' do
    it 'destroy dream' do
      expect {
        delete :destroy, format: :json, id: dream.id
      }.to change(Dream, :count).by(-1)
    end

    it 'response no content' do
      delete :destroy, format: :json, id: dream.id
      response.status.should == 204
    end
  end
end
