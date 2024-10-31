class Demos::RateLimitsController < ApplicationController
  skip_before_action :authenticate
  rate_limit only: :create, to: 3, within: 3.seconds, with: -> {
    reset_counter
    flash[:notice] = "You have reached your rate limit"
    redirect_to demos_rate_limits_path
  }

  def index
  end

  def create
    self.count += 1
    redirect_back_or_to demos_rate_limits_path
  end

  def reset_counter
    self.count = 0
  end

  def count
    session[:count].to_i
  end
  helper_method :count

  def count=(value)
    session[:count] = value
  end
end
