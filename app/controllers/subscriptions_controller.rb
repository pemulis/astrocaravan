class SubscriptionsController < ApplicationController
  before_filter :load_subscribable
  before_filter :authenticate_user!

  def new
    @subscription = @subscribable.subscriptions.new
  end
  
  def create
    @subscription = @subscribable.subscriptions.new(subscription_params)
    if @subscription.save
      redirect_to @subscribable, notice: 'Subscription created.'
    else
      render :new
    end
  end

  def destroy
  end

  private

  def subscription_params
    params.require(:subscription).permit(:user_id, :subscribable_id, :subscribable_type)
  end

  def load_subscribable
    resource, id = request.path.split('/')[1,2]
    @subscribable = resource.singularize.classify.constantize.find(id)
  end
end
