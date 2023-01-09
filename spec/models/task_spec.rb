require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { User.create!(email: 'test@email.com', password: '123123') }
  let(:job) { Job.create!(title: 'Title', company: 'Company name', url: "www.url.com", user_id: user.id) }
  let(:task) { Task.new(title: 'Title', job_id: job.id) }

  describe '#initialize' do
    context 'when correct params are given' do
      it 'creates a Task instance' do
        task.save!
        expect(Task.last.title).to eq('Title')
      end
    end

    context 'when title is not given as a param' do
      before { task.title = nil }

      it 'is not a valid Task instance' do
        task.valid?
        expect(task.errors.messages).to eq({:title=>["can't be blank"]})
      end
    end
  end
end
