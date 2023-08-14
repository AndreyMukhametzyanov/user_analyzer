# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it { should validate_uniqueness_of(:phone_number).case_insensitive }
  end

  describe 'last_active scope' do
    let!(:active_user) { create(:user, last_visited_at: DateTime.now - 3.days) }
    let!(:inactive_user) { create(:user, last_visited_at: DateTime.now - 2.weeks) }

    it 'returns only active users' do
      expect(User.last_active).to match_array([active_user])
    end
  end
end
