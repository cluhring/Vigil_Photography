class GuestsController < ApplicationController
  def index
    @guest = Guest.new
  end

  def create
    @guest = Guest.new(guest_params)
    if @guest.save
      GuestMailer.notify(@guest).deliver_now
      flash[:success] = "Thank you for expressing interest in my Photography! I'll respond to your question(s) as soon as possible."
      redirect_to root_url
    else
      flash[:danger] = "Sorry something is amiss, please try again."
      render :index
    end
  end

  private

  def guest_params
    params.require(:guest).permit(:name,
                                 :email,
                                 :message)
  end
end
