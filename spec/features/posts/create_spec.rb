require 'rails_helper'

RSpec.describe 'Create a new post', feature: true do
  let(:post) { build(:post) }

  subject { page }

  before do
    visit new_post_path

    fill_in('Title', with: post.title)
    fill_in('Url', with: post.url)
    click_button('Create Post')
  end

  context 'with valid attributes' do
    it 'should be successful' do
      expect(page).to have_content('Post was successfully created')
    end
  end

  context 'with invalid attributes like' do
    context 'no title' do
      let(:post) { build(:post, title: nil) }

      it 'should not successful' do
        expect(page).to have_content('Title can\'t be blank')
      end
    end

    context 'no url' do
      let(:post) { build(:post, url: nil) }

      it 'should not successful' do
        expect(page).to have_content('Url can\'t be blank')
      end
    end
  end
end
