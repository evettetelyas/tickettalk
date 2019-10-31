# frozen_string_literal: true

class Interest < ApplicationRecord
  belongs_to :user

  validates_presence_of :keyword
end
