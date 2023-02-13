require 'rails_helper'

RSpec.describe Transaction, type: :model do
  # Test validation
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:amount) }
  it { should validate_presence_of(:one_category) }

  # Test associations
  it { should belong_to(:author) }
  it { should have_many(:category_transactions) }
  it { should have_many(:one_category).through(:category_transactions) }

end
