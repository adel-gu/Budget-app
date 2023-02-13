class Transaction < ApplicationRecord
  belongs_to :user
  has_many :category_transactions
  has_many :categories, through: :category_transactions
end
