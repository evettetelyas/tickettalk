class Review < ApplicationRecord
  validates_presence_of :content

  belongs_to :user
  belongs_to :reviewer, class_name: 'User'
end
