require 'rails_helper'

RSpec.describe PostMailer do
  describe '.weekly_email' do
    let(:posts) do
      [
        create(:post),
        create(:post),
        create(:post)
      ]
    end

    let(:subscribers) do
      [
        'some_subscriber@example.com',
        'some_other@example.com'
      ]
    end

    before do
      allow(Subscriber).to receive(:email_list).and_return(
        subscribers
      )
    end

    it 'sends an email from the right subject' do
      expect(described_class.weekly_email(posts).from)
        .to eq(['your-weekly@test.com'])
    end

    it 'sends an email to subscribers' do
      expect(described_class.weekly_email(posts).bcc).to eq(subscribers)
    end

    it 'sends an email with the right subject' do
      expect(described_class.weekly_email(posts).subject)
        .to eq("Your Weekly - #{Date.today}")
    end
  end
end
