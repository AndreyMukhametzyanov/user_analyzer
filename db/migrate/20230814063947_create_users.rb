# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :name
      t.integer :age
      t.string :location
      t.string :phone_number
      t.datetime :last_visited_at

      t.timestamps
    end
  end
end
