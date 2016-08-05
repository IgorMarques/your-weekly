require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:post) { create(:post) }

  context 'a valid post' do
    context 'with all expected info' do
      it 'should be a valid post' do
        expect(post).to be_valid
      end
    end

    context 'without descrption' do
      before do
        post.description = nil
      end

      it 'should be a valid post' do
        expect(post).to be_valid
      end
    end
  end

  context 'an invalid post' do
    context 'without title' do
      before do
        post.title = nil
      end

      it 'should not be a valid post' do
        expect(post).to_not be_valid
      end
    end

    context 'without url' do
      before do
        post.url = nil
      end

      it 'should not be a valid post' do
        expect(post).to_not be_valid
      end
    end
  end
end
