# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :prefix_id

      t.timestamps
    end

    add_index :users, :prefix_id, unique: true
  end
end
