# frozen_string_literal: true

class StandUp < ApplicationRecord
  belongs_to :project
  belongs_to :student
  validates_presence_of :date
end
