class CategoryTransaction < ApplicationRecord
  belongs_to :one_category, class_name:'Category', foreign_key: 'category_id'
  belongs_to :one_transaction, class_name:'Transaction', foreign_key: 'transaction_id'
end
