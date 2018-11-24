class Admin::BadgesController < ApplicationController

  before_action :set_badge, only: %i[show update destroy edit]

  def index
    @badges = Badge.all
  end

  def show
  end

  def new
    @badge = Badge.new
  end

  def edit
  end

  def create
    @badge = current_user.own_badges.new(badge_params)

    if @badge.save
      redirect_to [:admin, @badge], notice: t('.success')
    else
      render :new
    end
  end

  def update
   if @badge.update(badge_params)
      redirect_to [:admin, @badge]
    else
      render :edit
    end
  end

  def destroy
    @badge.destroy
    redirect_to admin_badges_path
  end

  private

  def badge_params
    params.require(:badge).permit(:title, :img_address, :rule, :rule_value)
  end

  def set_badge
    @badge = Badge.find(params[:id])
  end

end
