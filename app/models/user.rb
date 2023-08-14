# frozen_string_literal: true

class User < ApplicationRecord
  validates :phone_number, uniqueness: true
  scope :last_active, -> { where('last_visited_at >= ?', 1.week.ago) }
end
