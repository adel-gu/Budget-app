class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transactions
  has_many :transactions, through: :category_transactions
end
