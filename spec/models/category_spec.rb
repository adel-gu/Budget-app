require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }

  # Test validation
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:icon) }

  # Test associations
  it { should belong_to(:author) }
  it { should have_many(:transactions) }

  # Test instance methods
  context 'check validation' do
    subject { Category.new(name: 'Games', icon: 'games.jpg', author: user) }

    before { subject.save }

    it 'when name and icon are presence category should be valid' do
      expect(subject).to be_valid
    end

    it 'when name not presence category should be not valid' do
      subject.name = nil
      expect(subject).to_not be_valid
    end

    it 'when icon not presence category should be not valid' do
      subject.icon = nil
      expect(subject).to_not be_valid
    end
  end
end
