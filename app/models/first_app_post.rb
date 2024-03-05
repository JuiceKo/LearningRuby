class FirstAppPost < ApplicationRecord
  validates :titl, presence: true
  validates :body, presence: true
end
