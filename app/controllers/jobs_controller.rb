class JobsController < ApplicationController

  def index
    @jobs = policy_scope(Job)
    authorize @jobs
  end
end
