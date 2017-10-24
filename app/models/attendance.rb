# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :semester
  belongs_to :student
  validates_presence_of :date
end
