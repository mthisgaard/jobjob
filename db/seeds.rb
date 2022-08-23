require 'faker'

puts 'Removing all users, jobs and tasks...'
User.destroy_all

puts 'Creating users...'
User.create!(email: 'adam@me.com', first_name: 'adam', last_name: '928', password: '123123', avatar: 'https://avatars.githubusercontent.com/u/103736492?v=4')
User.create!(email: 'malene@me.com', first_name: 'malene', last_name: '928', password: '123123', avatar: 'https://avatars.githubusercontent.com/u/107089457?v=4')
User.create!(email: 'andre@me.com', first_name: 'andre', last_name: '928', password: '123123', avatar: 'https://avatars.githubusercontent.com/u/102734981?v=4')
User.create!(email: 'nikki@me.com', first_name: 'nikki', last_name: '928', password: '123123', avatar: 'https://avatars.githubusercontent.com/u/94282878?v=4')
puts "created #{User.count} users"

puts 'Creating jobs...'
User.all.each do |user|
  rand(6..9).times do
    Job.create!(
      title: Faker::Job.title,
      company: Faker::Company.name,
      deadline: Date.today + rand(20),
      url: 'https://www.linkedin.com/jobs/'
      user: user
    )
  end
end
puts "created #{Job.count} jobs"

puts 'Creating tasks...'
Job.all.each do |job|
    Task.create!(
      title: 'Research the company'
      job: job
    )
    Task.create!(
      title: 'Write cover letter'
      job: job
    )
    Task.create!(
      title: 'Call contact person at the company'
      job: job
    )
  end
end
puts "created #{Task.count} tasks"


