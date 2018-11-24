class BadgeReceptionsController < ApplicationController

  def index
    @badges = Badge.all
    @badge_receptions = current_user.badges
  end

end
