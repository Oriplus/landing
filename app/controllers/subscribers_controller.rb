class SubscribersController < ApplicationController
  def new
    @subscriber = Subscriber.new
    @preferences_list = Preference.all
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)
    if @subscriber.save
      redirect_to root_path, notice: t(".created")
    else
      @preferences_list = Preference.all
      render :new, status: :unprocessable_entity
    end
  end

  private

  def subscriber_params
    params.require(:subscriber).permit(:email, preference_ids: [])
  end
end
