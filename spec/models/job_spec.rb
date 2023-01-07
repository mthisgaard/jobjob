require 'rails_helper'

RSpec.describe Job, type: :model do
  describe '#initialize' do
    it 'creates a Job instance' do
      user = User.create!(email: 'test@email.com', password: '123123')
      Job.create!(title: 'Title', company: 'Company name', url: "www.url.com", user_id: user.id)
      expect(Job.last.title).to eq('Title')
    end

    it 'does not create a Job instance when not given a user' do
      job = Job.new(title: 'Title', company: 'Company name', url: "www.url.com")
      job.valid?
      expect(job.errors.messages).to eq({:user=>["must exist"]})
    end
  end
end