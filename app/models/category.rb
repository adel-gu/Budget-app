class Category < ApplicationRecord
  belongs_to :user
  has_many :category_transactions
  has_many :transactions, through: :category_transactions
  validate :name, :icon, presence: true

  def category_total_amount
    self.transactions.sum(:amount)
  end

  def category_recent_transactions
    self.transactions.all.order(updated_at: :desc)
  end
end
