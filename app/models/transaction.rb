class Transaction < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_transactions
  has_many :one_category, through: :category_transactions
  validates :name, :amount, :category, presence: true
end
