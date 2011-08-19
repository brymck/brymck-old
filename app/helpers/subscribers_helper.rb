module SubscribersHelper
  def subscriber_action_tag(subscriber)
    case subscriber.status
    when :active       then link_to t(".deactivate"), deactivate_subscriber_path(subscriber), method: :put
    when :inactive     then link_to t(".activate"),   activate_subscriber_path(subscriber),   method: :put
    when :unapproved   then link_to t(".approve"),    approve_subscriber_path(subscriber),    method: :put
    when :unsubscribed then nil
    else nil
    end
  end
end
