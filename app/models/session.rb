class Session < ApplicationRecord
  belongs_to :user

  before_create do
    self.user_agent = Current.user_agent
    self.ip_address = Current.ip_address

    self.sudo_at = Time.current
  end

  after_create { user.events.create! action: "signed_in" }
  after_destroy { user.events.create! action: "signed_out" }

  def sudo?
    sudo_at > 30.minutes.ago
  end
end
