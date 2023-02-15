class Category < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  has_many :transactions
  validates :name, :icon, presence: true

  def category_total_amount
    self.transactions.sum(:amount)
  end

  def category_recent_transactions
    self.transactions.order(updated_at: :desc)
  end
end
