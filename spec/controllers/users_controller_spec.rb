# frozen_string_literal: true

require 'rails_helper'
require 'spec_helper'

RSpec.describe UsersController do
  describe '#feed' do
    let!(:user1) { create(:user, last_visited_at: Time.now) }
    let!(:user2) { create(:user, last_visited_at: Time.now - 1.day) }
    let!(:user3) { create(:user, last_visited_at: Time.now - 2.days) }
    let!(:user4) { create(:user, last_visited_at: Time.now - 3.weeks) }

    context 'with default params' do
      before { get :feed }

      it 'returns all users' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).count).to eq(4)
      end
    end

    context 'with page param' do
      before { get :feed, params: { page: 2, per_page: 1 } }

      it 'returns the correct user' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).count).to eq(1)
        expect(JSON.parse(response.body)[0]['id']).to eq(user2.id)
      end
    end

    context 'with last_visited param' do
      before { get :feed, params: { last_visited: 1 } }

      it 'returns the correct users' do
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body).count).to eq(3)
        expect(JSON.parse(response.body)[0]['id']).to eq(user1.id)
        expect(JSON.parse(response.body)[1]['id']).to eq(user2.id)
      end
    end
  end
end
