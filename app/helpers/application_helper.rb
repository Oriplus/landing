module ApplicationHelper
  def error_message_for(object, attribute)
    if object.errors[attribute].present?
      content_tag :div, object.errors[attribute].join(", "), class: 'error-message'
    end
  end
end
