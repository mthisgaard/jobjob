require 'rails_helper'

RSpec.describe Job, type: :model do
  let(:user) { User.create!(email: 'test@email.com', password: '123123') }
  let(:job) { Job.new(title: 'Title', company: 'Company name', url: "www.url.com", user_id: user.id) }

  describe '#initialize' do
    context 'when correct params are given' do
      it 'creates a Job instance' do
        job.save!
        expect(Job.last.title).to eq('Title')
      end
    end

    context 'when title is not given as a param' do
      before { job.title = nil }

      it 'is not a valid Job instance' do
        job.valid?
        expect(job.errors.messages).to eq({:title=>["can't be blank"]})
      end
    end
  end
end
