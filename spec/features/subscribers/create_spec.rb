require 'rails_helper'

RSpec.describe 'Create a new subscriber', feature: true do
  let(:subscriber) { build(:subscriber) }

  subject { page }

  before do
    visit new_subscriber_path

    fill_in('Email', with: subscriber.email)
    click_button('Create Subscriber')
  end

  context 'with valid attributes' do
    it 'should be successful' do
      expect(page).to have_content('Subscription created!')
    end
  end

  context 'with invalid attributes like' do
    context 'no e-mail' do
      let(:subscriber) { build(:subscriber, email: nil) }

      it 'should not successful' do
        expect(page).to have_content('Email can\'t be blank')
      end
    end

    context 'duplicated e-mail' do
      let(:new_subscriber) { build(:subscriber) }

      before do
        visit new_subscriber_path

        fill_in('Email', with: new_subscriber.email)
        click_button('Create Subscriber')
      end

      it 'should not successful' do
        expect(page).to have_content('Email has already been taken')
      end
    end
  end
end
