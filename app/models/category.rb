class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :category_transactions
  has_many :one_transaction, through: :category_transactions
  validates :name, :icon, presence: true

  def category_total_amount
    self.one_transaction.sum(:amount)
  end

  def category_recent_transactions
    transactions.all.order(updated_at: :desc)
  end
end
