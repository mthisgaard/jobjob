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
    job = Job.new(
      title: Faker::Job.title,
      company: Faker::Company.name,
      deadline: Date.today + rand(20),
      url: 'https://www.linkedin.com/jobs/',
      notes: 'Lorem ipsum dolor sit amet consectetur adipisicing elit. Maxime mollitia,
      molestiae quas vel sint commodi repudiandae consequuntur voluptatum laborum
      numquam blanditiis harum quisquam eius sed odit fugiat iusto fuga praesentium
      optio, eaque rerum! Provident similique accusantium nemo autem. Veritatis
      obcaecati tenetur iure eius earum ut molestias architecto voluptate aliquam
      nihil, eveniet aliquid culpa officia aut! Impedit sit sunt quaerat, odit,
      tenetur error, harum nesciunt ipsum debitis quas aliquid.'
    )
    job.user = user
    job.save!
  end
end
puts "created #{Job.count} jobs"

puts 'Creating tasks...'
Job.all.each do |job|
  task_1 = Task.new(
    title: 'Research the company'
  )
  task_1.job = job
  task_1.save!

  task_2 = Task.new(
    title: 'Write cover letter'
  )
  task_2.job = job
  task_2.save!

  task_3 = Task.new(
    title: 'Call contact person at the company'
  )
  task_3.job = job
  task_3.save!
end
puts "created #{Task.count} tasks"
