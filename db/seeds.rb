require 'faker'

puts 'Removing all users, jobs and tasks...'
User.destroy_all

puts 'Creating users...'
User.create!(email: 'adam@me.com', first_name: 'adam', last_name: '928', password: '123123', avatar: 'https://avatars.githubusercontent.com/u/103736492?v=4')
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
      status: rand(0..4),
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

puts "creating account for demo"

###################################################################

demo = User.create!(email: 'malene@me.com', first_name: 'malene', last_name: '928', password: '123123', avatar: 'https://avatars.githubusercontent.com/u/107089457?v=4')

puts "creating realistic jobs"

############ JOB 1 #############

job = Job.new(
  title: "Front-end Developer",
  company: 'TableCheck',
  deadline: Date.today + rand(20),
  url: 'https://jp.linkedin.com/jobs/view/front-end-developer-at-tablecheck-3217604304?refId=z1Iig2xD6Cpt2YnYZn2JtA%3D%3D&trackingId=eJ3OAeFdbDfzCbzua1raug%3D%3D&position=1&pageNum=0&trk=public_jobs_jserp-result_search-card',
  status: 2,
  notes: 'Fully remote, front-end position for online reservation business.

Japanese not required. (they got language exchange program for practicing my Japanese)

Pays for commuter pass.

First interview went really well!!!',
  user: demo
)
job.save!

task = Task.new(
  title: 'Research the company',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Write cover letter',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (William)',
  done: true,
  job:
)
task.save!


task = Task.new(
  title: 'First interview Aug 26th 3pm (zoom)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Review datasets before interview!!!',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Send thank you for interview email to William',
  job:
)
task.save!

task = Task.new(
  title: 'Follow up email if no news by Sep 1st',
  job:
)
task.save!

############ JOB 2 #############

job = Job.new(
  title: "Back End Engineer (Go)",
  company: 'Computer Futures',
  deadline: Date.today + rand(20),
  url: 'https://jp.linkedin.com/jobs/view/back-end-engineer-go-at-computer-futures-3226955401?refId=d0f%2FRQKnp0cXAJAfAUEG0w%3D%3D&trackingId=URE%2Bmrl9OrBMEHorBQoq2g%3D%3D&trk=public_jobs_similar-jobs',
  status: 0,
  notes: 'Mainly Go

remote with home office setup support

international environment (english)',
  user: demo
)
job.save!

task = Task.new(
  title: 'Research the company',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Write cover letter',
  job:
)
task.save!

task = Task.new(
  title: 'Send cover letter to company (Sheldon)',
  job:
)
task.save!

task = Task.new(
  title: 'Review Go',
  job:,
  done: true
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Sheldon)',
  job:
)
task.save!

task = Task.new(
  title: 'Review Go even more!',
  job:
)
task.save!
