require 'rails_helper'

RSpec.describe CategoryTransaction, type: :model do
  # Test associations
  it { should belong_to(:one_transaction) }
  it { should belong_to(:one_category) }
end
