class SubscriptionMailer < ActionMailer::Base
  include SendGrid
  default from: "subscriptions@hackonauts.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_subscription.subject
  #
  def new_subscription(user, subscribable)
    @user = user 
    @subscribable = subscribable 

    mail to: user.email, subject: "Subscribed to #{subscribable} Updates"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.new_comment.subject
  #
  def new_comment(user, body)
    @user = user
    @body = body

    # mail to all the users subscribed to the thread when a new 
    # comment is posted
  end
end
