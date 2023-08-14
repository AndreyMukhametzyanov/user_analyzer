# frozen_string_literal: true

class UsersController < ApplicationController
  def feed
    page = params[:page] || 1
    per_page = params[:per_page] || 100
    last_visited = params[:last_visited].to_i || 0

    users = if last_visited == 1
              User.last_active.page(page).per(per_page)
            else
              User.all.page(page).per(per_page)
            end

    render json: users
  end
end
