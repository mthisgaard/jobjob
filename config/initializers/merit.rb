# Use this hook to configure merit parameters
# Merit.setup do |config|
  # Check rules on each request or in background
  # config.checks_on_each_request = true

  # Add application observers to get notifications when reputation changes.
  # config.add_observer 'MyObserverClassName'

  # Define :user_model_name. This model will be used to grant badge if no
  # `:to` option is given. Default is 'User'.
  # config.user_model_name = 'User'

  # Define :current_user_method. Similar to previous option. It will be used
  # to retrieve :user_model_name object if no `:to` option is given. Default
  # is "current_#{user_model_name.downcase}".
  # config.current_user_method = 'current_user'
# end

# Create application badges (uses https://github.com/norman/ambry)
Rails.application.reloader.to_prepare do
  [{
    id: 1,
    name: "JobJob Pro",
    description: "Completed 3 tasks in one day",
    custom_fields: "badge1_static.png"
  }, {
    id: 2,
    name: 'Jobberwocky',
    description: "Completed 5 tasks in one day",
    custom_fields: "badge2_static.png"
  }, {
    id: 3,
    name: 'Numero Jobbo',
    description: "Applied to your first job",
    custom_fields: "badge3_static.png"
  }, {
    id: 4,
    name: 'Good JobJob',
    description: "Applied to 3 jobs",
    custom_fields: "badge4_static.png"
  }, {
    id: 5,
    name: 'Steve Jobs',
    description: "Applied to 5 jobs",
    custom_fields: "badge5_static.png"
  }, {
    id: 6,
    name: 'Job Magnet',
    description: "Get 3 interviews",
    custom_fields: "badge6_static.png"
  }, {
    id: 7,
    name: 'Jobbapalooza',
    description: "Get 5 interviews",
    custom_fields: "badge7_static.png"
  }, {
    id: 8,
    name: 'The Jobfather',
    description: "Get a job offer",
    custom_fields: "badge8_static.png"
  }].each do |attrs|
    Merit::Badge.create! attrs
  end
end
