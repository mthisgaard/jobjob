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
    custom_fields: { icon: "badge1_static.png", badge: "badge1.gif" }
  }, {
    id: 2,
    name: 'Jobberwocky',
    description: "Completed 5 tasks in one day",
    custom_fields: { icon: "badge2_static.png", badge: "badge2.gif" }
  }, {
    id: 3,
    name: 'Numero Jobbo',
    description: "Applied to your first job",
    custom_fields: { icon: "badge3_static.png", badge: "badge3.gif" }
  }, {
    id: 4,
    name: 'Good JobJob',
    description: "Applied to 3 jobs",
    custom_fields: { icon: "badge4_static.png", badge: "badge4.gif" }
  }, {
    id: 5,
    name: 'Steve Jobs',
    description: "Applied to 5 jobs",
    custom_fields: { icon: "badge5_static.png", badge: "badge5.gif" }
  }, {
    id: 6,
    name: 'Job Magnet',
    description: "Get 3 interviews",
    custom_fields: { icon: "badge6_static.png", badge: "badge6.gif" }
  }, {
    id: 7,
    name: 'Jobbapalooza',
    description: "Get 5 interviews",
    custom_fields: { icon: "badge7_static.png", badge: "badge7.gif" }
  }, {
    id: 8,
    name: 'ConJOBulations!',
    description: "Get a job offer",
    custom_fields: { icon: "badge8_static.png", badge: "badge8.gif" }
  }].each do |attrs|
    Merit::Badge.create! attrs
  end
end
