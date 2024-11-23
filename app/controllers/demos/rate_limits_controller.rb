class Demos::RateLimitsController < ApplicationController
  skip_before_action :authenticate
  rate_limit only: :create, to: 3, within: 3.seconds, with: -> {
    flash[:alert] = "You have reached your rate limit"
    redirect_to demos_rate_limits_path
  }

  def index
  end

  def create
    if params[:reset]
      reset_counter
    else
      self.count += 1
    end
    redirect_back_or_to demos_rate_limits_path
  end

  private

  helper_method def count
    session[:count].to_i
  end

  def reset_counter
    session.delete(:count)
  end

  def count=(value)
    session[:count] = value
  end
end
