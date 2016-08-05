require 'rails_helper'

RSpec.describe PostSentUpdater do
  describe '.call' do
    let(:posts) do
      [
        create(:post),
        create(:post),
        create(:post)
      ]
    end

    it 'updates the sent_on attribute of every post with today\'s date' do
      described_class.call(posts)

      posts.each do |post|
        expect(post.sent_on).to eq(Date.today)
      end
    end
  end
end
