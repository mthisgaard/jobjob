json.array! @jobs do |job|
  json.extract! job, :title, :company, :url
end
