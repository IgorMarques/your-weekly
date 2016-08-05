require 'rails_helper'

RSpec.describe NewsletterSender do
  describe '.call' do
    before do
      allow(PostMailer).to receive_message_chain(:weekly_email, :deliver)
      allow(PostSentUpdater).to receive(:call)
    end

    it 'sends the not sent posts' do
      described_class.call

      expect(PostMailer)
        .to have_received(:weekly_email).with(Post.not_sent).once
    end

    it 'updates the sent_on attribute of the posts' do
      described_class.call

      expect(PostSentUpdater).to have_received(:call).with(Post.not_sent).once
    end
  end
end
