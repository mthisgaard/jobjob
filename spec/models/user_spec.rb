require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create!(email: 'test@email.com', password: '123123') }

  describe '#initialize' do
    context 'when correct params are given' do
      it 'creates a User instance' do
        user.save!
        expect(User.last.email).to eq('test@email.com')
      end
    end

    context 'when email is not given as a param' do
      before { user.email = nil }

      it 'is not a valid User instance' do
        user.valid?
        expect(user.errors.messages).to eq({:email=>["can't be blank"]})
      end
    end
  end
end
