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

demo1 = User.create!(email: 'malene1@me.com', first_name: 'malene', last_name: '928', password: '123123', avatar: 'https://avatars.githubusercontent.com/u/107089457?v=4')

puts "creating realistic jobs"

############ JOB 1 #############

job = Job.new(
  title: "Front-end Developer",
  company: 'TableCheck',
  deadline: Date.today + 5,
  url: 'https://jp.linkedin.com/jobs/view/front-end-developer-at-tablecheck-3217604304?refId=z1Iig2xD6Cpt2YnYZn2JtA%3D%3D&trackingId=eJ3OAeFdbDfzCbzua1raug%3D%3D&position=1&pageNum=0&trk=public_jobs_jserp-result_search-card',
  status: 2,
  notes: 'Fully remote, front-end position for online reservation business.

Japanese not required. (they got language exchange program for practicing my Japanese)

Pays for commuter pass.

First interview went really well!!!',
  user: demo1
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
  title: 'Call contact person at the company (Percy)',
  done: true,
  job:
)
task.save!


# task = Task.new(
#   title: 'First interview Aug 26th 3pm (zoom)',
#   done: true,
#   job:
# )
# task.save!

task = Task.new(
  title: 'Review datasets before interview!!!',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Send thank you for interview email to Percy',
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
  deadline: Date.today + 7,
  url: 'https://jp.linkedin.com/jobs/view/back-end-engineer-go-at-computer-futures-3226955401?refId=d0f%2FRQKnp0cXAJAfAUEG0w%3D%3D&trackingId=URE%2Bmrl9OrBMEHorBQoq2g%3D%3D&trk=public_jobs_similar-jobs',
  status: 0,
  notes: 'Mainly Go

remote with home office setup support

international environment (english)',
  user: demo1
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
  title: 'Send cover letter to company (Gwen)',
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
  title: 'Call contact person at the company (Gwen)',
  job:
)
task.save!

task = Task.new(
  title: 'Review Go even more!',
  job:
)
task.save!


########################## JOB 3 #################3

job = Job.new(
  title: "Sales Enginner",
  company: 'Radware',
  deadline: Date.today + 12,
  url: 'https://jp.linkedin.com/jobs/view/sales-engineer-japan-at-radware-3119583865?refId=ThJ5RpPpXD0eY3NLXJQfJg%3D%3D&trackingId=zt%2F5CXq5GwqKdVAa55Ds3A%3D%3D&trk=public_jobs_people-also-viewed',
  status: 0,
  notes: 'cybersecurity company

Sales team system engineer

Gonna be doing lots of presentations',
  user: demo1
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
  title: 'Send cover letter to company (Arther)',
  job:
)
task.save!

task = Task.new(
  title: 'Study some about business and marketing',
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Arther)',
  job:
)
task.save!

task = Task.new(
  title: 'Get good with reverse proxies and CDN',
  job:
)
task.save!

########################## JOB  4 #################

job = Job.new(
  title: "Platform Engineer",
  company: 'Bitcoin Bills',
  deadline: Date.yesterday,
  url: 'https://jp.linkedin.com/jobs/view/platform-engineer-techlead-senior-software-engineer-at-%E6%A0%AA%E5%BC%8F%E4%BC%9A%E7%A4%BE%E3%82%A8%E3%82%AF%E3%82%B5%E3%82%A6%E3%82%A3%E3%82%B6%E3%83%BC%E3%82%BA-exawizards-inc-3040632081?refId=ThJ5RpPpXD0eY3NLXJQfJg%3D%3D&trackingId=WVaaKvKI9ooqCwQ%2BPfgWJQ%3D%3D&trk=public_jobs_people-also-viewed',
  status: 0,
  notes: 'Need conversational Japanese

focused on machine learning technologies for the sake of solving social issues

Scipy/Numpy, Scikit-Learn, Pandas, Tensorflow/Keras/PyTorch',
  user: demo1
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
  title: 'Send cover letter to company (Mr. Merlin)',
  job:
)
task.save!

task = Task.new(
  title: 'Look up common Japanese work vocabulary',
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Mr. Merlin)',
  job:
)
task.save!

task = Task.new(
  title: 'Review machine learning frameworks',
  job:
)
task.save!

###########################3 5555555555555555555 ###################33

job = Job.new(
  title: "Software Engineer",
  company: 'Mercari',
  deadline: Date.today + 2,
  url: 'https://jp.linkedin.com/jobs/view/software-engineer-frontend-mercari-at-mercari-inc-2884177585?refId=LMaXwM7cEa5I3yLlaGTRPQ%3D%3D&trackingId=%2FkQD%2FW2e7APwYBrD7hVu0Q%3D%3D&trk=public_jobs_people-also-viewed',
  status: 1,
  notes: 'Frontend

iOS and Android

fully remote OR Office - Roppongi (gonna be good working here on Fridays)

International environment',
  user: demo1
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
  title: 'Send cover letter to company (Vivian)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'ask about Incentive program',
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Vivian)',
  job:
)
task.save!

###########################3 66666666666 ###################33

job = Job.new(
  title: "Software Engineer",
  company: 'Woven Planet',
  deadline: Date.today + 2,
  url: 'https://jp.linkedin.com/jobs/view/software-engineer-hardware-emulation-at-woven-planet-3207664207?refId=9hwKS2RjjF0YhKcP9AB1kg%3D%3D&trackingId=woxdkKOw8Oy%2FeMgjAOfUhA%3D%3D&trk=public_jobs_people-also-viewed',
  status: 1,
  notes: 'Hardware Emulation

Part of Toyota Research Institute

Vehicle Software and automatic driving',
  user: demo1
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
  title: 'Send cover letter to company (Morgan)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Learn to drive to know more about vehicles',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Morgan)',
  done: true,
  job:
)
task.save!

puts "created #{demo1.jobs.count} jobs for demo"

puts "travelling 2 weeks in the future"

###################################################################

demo2 = User.create!(email: 'malene.thisgaard@gmail.com', first_name: 'malene', last_name: '928', password: '123123', avatar: 'https://avatars.githubusercontent.com/u/107089457?v=4')

puts "Updating demo jobs and adding some more"



############ JOB 1 #############

job = Job.new(
  title: "Front-end Developer",
  company: 'TableCheck',
  deadline: Date.today + 5,
  url: 'https://jp.linkedin.com/jobs/view/front-end-developer-at-tablecheck-3217604304?refId=z1Iig2xD6Cpt2YnYZn2JtA%3D%3D&trackingId=eJ3OAeFdbDfzCbzua1raug%3D%3D&position=1&pageNum=0&trk=public_jobs_jserp-result_search-card',
  status: 3,
  logo_url: 'https://media-exp1.licdn.com/dms/image/C560BAQGJLM97eHnD3Q/company-logo_200_200/0/1642072893590?e=1669852800&v=beta&t=AwXvl9uzJ2ouS2BZls4UN39_fRSP4r-dYdimNRzXIxs',
  notes: 'Fully remote or in office, front-end position for online reservation business.

Japanese not required. (they got language exchange program for practicing my Japanese)

Pays for commuter pass.

First interview went really well!!!

Second interview was also great へ__へ',
  user: demo2
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
  title: 'Call contact person at the company (Percy)',
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
  title: 'Send thank you for interview email to Percy',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Follow up email if no news by Sep 1st',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Tell mum about job offer',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Accept job offer (?)',
  job:
)

task.save!
task = Task.new(
  title: 'Look into apartments around office location',
  job:
)
task.save!


############ JOB 2 #############

job = Job.new(
  title: "Back End Engineer (Go)",
  company: 'Computer Futures',
  deadline: Date.today + 7,
  url: 'https://jp.linkedin.com/jobs/view/back-end-engineer-go-at-computer-futures-3226955401?refId=d0f%2FRQKnp0cXAJAfAUEG0w%3D%3D&trackingId=URE%2Bmrl9OrBMEHorBQoq2g%3D%3D&trk=public_jobs_similar-jobs',
  status: 4,
  logo_url: 'https://media-exp1.licdn.com/dms/image/C4D0BAQGXzDswjXmJ8A/company-logo_200_200/0/1627463837466?e=1669852800&v=beta&t=xFKiOl3L4lD9rFdya7itrn6Uw_vZD2EkTVln_3lMVfc',
  notes: 'Mainly Go

remote with home office setup support

international environment (english)

Rejection Reason: Go skills not good enough',
  user: demo2
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
  title: 'Send cover letter to company (Gwen)',
  done: true,
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
  title: 'Call contact person at the company (Gwen)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Review Go even more!',
  done: true,
  job:
)
task.save!


########################## JOB 3 #################3

job = Job.new(
  title: "Sales Enginner",
  company: 'Radware',
  deadline: Date.today + 12,
  url: 'https://jp.linkedin.com/jobs/view/sales-engineer-japan-at-radware-3119583865?refId=ThJ5RpPpXD0eY3NLXJQfJg%3D%3D&trackingId=zt%2F5CXq5GwqKdVAa55Ds3A%3D%3D&trk=public_jobs_people-also-viewed',
  status: 1,
  logo_url: 'https://media-exp1.licdn.com/dms/image/C4D0BAQGAIb_cHyq7vw/company-logo_200_200/0/1520441298068?e=1669852800&v=beta&t=VdEgGMI-KZzixH6skiGNQgnYySk31oOg3yvE4tSjXaY',
  notes: 'cybersecurity company

Sales team system engineer

Gonna be doing lots of presentations',
  user: demo2
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
  title: 'Send cover letter to company (Arther)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Study some about business and marketing',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Arther)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Get good with reverse proxies and CDN',
  job:
)
task.save!

########################## JOB  4 #################

job = Job.new(
  title: "Platform Engineer",
  company: 'ExaWizards Inc',
  deadline: Date.today + 12,
  url: 'https://jp.linkedin.com/jobs/view/platform-engineer-techlead-senior-software-engineer-at-%E6%A0%AA%E5%BC%8F%E4%BC%9A%E7%A4%BE%E3%82%A8%E3%82%AF%E3%82%B5%E3%82%A6%E3%82%A3%E3%82%B6%E3%83%BC%E3%82%BA-exawizards-inc-3040632081?refId=ThJ5RpPpXD0eY3NLXJQfJg%3D%3D&trackingId=WVaaKvKI9ooqCwQ%2BPfgWJQ%3D%3D&trk=public_jobs_people-also-viewed',
  status: 1,
  logo_url: 'https://media-exp1.licdn.com/dms/image/C510BAQF5pE2c-WuqMg/company-logo_200_200/0/1554128607290?e=1669852800&v=beta&t=t_fvgTYC6sPMWDTAcOw_Sk-OB75lQAQ1qvQoGmuuby8',
  notes: 'Need conversational Japanese

focused on machine learning technologies for the sake of solving social issues

Scipy/Numpy, Scikit-Learn, Pandas, Tensorflow/Keras/PyTorch',
  user: demo2
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
  title: 'Send cover letter to company (Mr. Merlin)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Look up common Japanese work vocabulary',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Mr. Merlin)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Review machine learning frameworks',
  done: true,
  job:
)
task.save!

###########################3 5555555555555555555 ###################33

job = Job.new(
  title: "Software Engineer",
  company: 'Mercari',
  deadline: Date.today + 2,
  url: 'https://apply.workable.com/mercari/j/EBE51B237C/',
  status: 0,
  logo_url: 'https://workablehr.s3.amazonaws.com/uploads/account/logo/292085/logo',
  notes: 'Fully remote OR Office
International environment',
  user: demo2
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

###########################3 66666666666 ###################33

job = Job.new(
  title: "Software Engineer",
  company: 'Woven Planet',
  deadline: Date.today + 2,
  url: 'https://jp.linkedin.com/jobs/view/software-engineer-hardware-emulation-at-woven-planet-3207664207?refId=9hwKS2RjjF0YhKcP9AB1kg%3D%3D&trackingId=woxdkKOw8Oy%2FeMgjAOfUhA%3D%3D&trk=public_jobs_people-also-viewed',
  status: 2,
  logo_url: 'https://media-exp1.licdn.com/dms/image/C560BAQFKQPQFNQrIVg/company-logo_200_200/0/1608545550416?e=1669852800&v=beta&t=3aAn-NVAIQzK53t4DfcEApzbWt2Y8UQ-y9fha6-Jiig',
  notes: 'Hardware Emulation

Part of Toyota Research Institute

Vehicle Software and automatic driving

virtual vehicle E/E architecture

mostly C/C++ & Python',
  user: demo2
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
  title: 'Send cover letter to company (Morgan)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Learn to drive to know more about vehicles',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Morgan)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Spend some time on Python syntax',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Get better with Japanese vehicle vocabulary',
  job:
)
task.save!

###########################3 77777777777777777 ###################33

job = Job.new(
  title: "Fullstack Software Engineer",
  company: 'Ascent Robotics, Inc.',
  deadline: Date.today + 22,
  url: 'https://jp.linkedin.com/jobs/view/full-stack-software-engineer-no-japanese-required-at-ascent-robotics-inc-3231268709?refId=vnAA%2BFZzs7fM5XdxeX9GKw%3D%3D&trackingId=IzsO6sqV4020fH6UhNS2oQ%3D%3D&trk=public_jobs_similar-jobs',
  status: 0,
  logo_url: 'https://media-exp1.licdn.com/dms/image/C560BAQG09R2SkesYeg/company-logo_200_200/0/1614826499474?e=1669852800&v=beta&t=Z7wX5tBmw2wqwoQnGhR0MZxrIVxi1j7YGFPrQvCaLNY',
  notes: 'several different areas such as webservices, front-end visualization, mobile applications, and more both on internal software and customer products

Good Linux knowledge required',
  user: demo2
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
  title: 'Send cover letter to company (Gawain)',
  job:
)
task.save!

task = Task.new(
  title: 'Get more practice with linux',
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Gawain)',
  job:
)
task.save!

###########################3 8888888888888888888888888 ###################33

job = Job.new(
  title: "Web Devloper",
  company: 'Computer Futures',
  deadline: Date.today + 22,
  url: 'https://jp.linkedin.com/jobs/view/web-developer-at-computer-futures-3192880999?refId=ygRveIXSGpar9ZmmIQ8szA%3D%3D&trackingId=sxz5EcHK%2BRL2KHgFSZWT%2BQ%3D%3D&trk=public_jobs_topcard-title',
  status: 2,
  logo_url: 'https://media-exp1.licdn.com/dms/image/C4D0BAQGXzDswjXmJ8A/company-logo_200_200/0/1627463837466?e=1669852800&v=beta&t=xFKiOl3L4lD9rFdya7itrn6Uw_vZD2EkTVln_3lMVfc',
  notes: 'Recruiting done through a third party company

part of payments team

JS + frameworks',
  user: demo2
)
job.save!

task = Task.new(
  title: 'Find out about company',
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
  title: 'Send cover letter to company (Leon)',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Go back to learning React',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Call contact person at the company (Leon)',
  job:
)
task.save!

task = Task.new(
  title: 'Become Redux master',
  job:
)
task.save!

###########################3 11 ###################33

job = Job.new(
  title: "Front-end Engineer",
  company: 'Line',
  deadline: Date.today + 3,
  url: 'https://www.tokyodev.com/companies/line-fukuoka/jobs/front-end-engineer/',
  status: 1,
  logo_url: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQU2MQZNVwCjygcF-aI4uyBPxBL_3w_icvz4rK6tjWgRw&s',
  notes: 'Expertise knowledge of HTML/CSS/JavaScript',
  contact_email: 'nikkirosecarlos@gmail.com',
  user: demo2
)
job.save!
task = Task.new(
  title: 'Write cover letter',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Research company',
  done: true,
  job:
)
task.save!

task = Task.new(
  title: 'Practice JavaScript',
  done: true,
  job:
)
task.save!

##################################

job = Job.new(
  title: "Web Application Developer",
  company: 'Small World',
  deadline: Date.today + 12,
  url: 'https://www.linkedin.com/jobs/search/?currentJobId=3212630909&distance=25&geoId=101355337&keywords=web%20developer',
  status: 0,
  logo_url: 'https://media-exp1.licdn.com/dms/image/C560BAQE7JirsfHnfBw/company-logo_200_200/0/1631613876470?e=1669852800&v=beta&t=YXdCwyklg8Gf1bzoxHYiuS62zkmfd4BLy23OpEFmdOY',
  notes: '',
  user: demo2
)
job.save!

task = Task.new(
  title: 'Research the company',
  job:
)
task.save!

task = Task.new(
  title: 'Write cover letter',
  job:
)
task.save!


###################################

job = Job.new(
  title: "Web Full Stack Engineer",
  company: 'Ringi',
  deadline: Date.today + 4,
  url: 'https://www.linkedin.com/jobs/view/3246273628/?alternateChannel=search&refId=uUtK5bdTtwcdFX5v8dca3g%3D%3D&trackingId=EDiewP5X0eQebN%2F4mqcVqw%3D%3D',
  status: 1,
  logo_url: 'https://media-exp1.licdn.com/dms/image/C4D0BAQECl-IAxbKSJA/company-logo_200_200/0/1655639019512?e=1669852800&v=beta&t=oV62chT4ZzW5NHYq6jgfb5Y7h9vlsYq5zrExRyj4aJk',
  notes: '',
  user: demo2
)
job.save!

task = Task.new(
  title: 'Research the company',
  job:
)
task.save!

task = Task.new(
  title: 'Write cover letter',
  job:
)
task.save!
