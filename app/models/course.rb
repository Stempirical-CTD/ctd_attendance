# frozen_string_literal: true

class Course < ApplicationRecord
  has_many :semesters
  validates :name, presence: true
end
