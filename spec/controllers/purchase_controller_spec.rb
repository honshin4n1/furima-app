require 'rails_helper'

RSpec.describe PurchaseController, type: :controller do
  describe 'GET #show' do
    it 'returns http success' do
      get :show, params: {  id: 1 }
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #done' do
    it 'returns http success' do
      get :done
      expect(response).to have_http_status(:success)
    end
  end

end
