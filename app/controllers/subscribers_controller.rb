class SubscribersController < ApplicationController
  before_action :set_preferences_list, only: [:new, :create]

  def new
    @subscriber = Subscriber.new
  end

  def create
    @subscriber = Subscriber.new(subscriber_params)

    if @subscriber.valid? && email_verified? && @subscriber.save
      redirect_to root_path, notice: t(".created")
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_preferences_list
    @preferences_list = Preference.all
  end

  def email_verified?
    email_validation_response = EmailValidationService.new(@subscriber.email).call
    body_response = email_validation_response[:body]
    if email_validation_response[:success] && body_response["quality_score"].to_f > 0.7
      true
    else
      @subscriber.errors.add(:email, t(".invalid_email"))
      false
    end
  end

  def subscriber_params
    params.require(:subscriber).permit(:email, preference_ids: [])
  end
end
