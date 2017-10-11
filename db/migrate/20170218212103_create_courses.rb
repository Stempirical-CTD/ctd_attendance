# frozen_string_literal: true

class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :name
    end
  end
end
