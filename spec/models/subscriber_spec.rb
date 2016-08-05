require 'rails_helper'

RSpec.describe Subscriber, type: :model do
  let(:subscriber) { create(:subscriber) }

  context 'a valid subscriber' do
    it 'should be a valid subscriber' do
      expect(subscriber).to be_valid
    end
  end

  context 'an valid subscriber' do
    before do
      subscriber.email = nil
    end

    it 'without email' do
      expect(subscriber).to_not be_valid
    end
  end

  context '.email_list' do
    before do
      create(:subscriber, email: 'user1@example.com')
      create(:subscriber, email: 'user2@example.com')
      create(:subscriber, email: 'user3@example.com')
    end

    it 'should return only the e-mails of all subscribers' do
      expect(described_class.email_list).to eq(
        [
          'user1@example.com',
          'user2@example.com',
          'user3@example.com'
        ]
      )
    end
  end
end
