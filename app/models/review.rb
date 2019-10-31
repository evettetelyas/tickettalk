# frozen_string_literal: true

class Review < ApplicationRecord
  validates_presence_of :content, :rating

  belongs_to :user
  belongs_to :reviewer, class_name: 'User'
end
