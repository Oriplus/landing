module ApplicationHelper
  def error_message_for(object, attribute)
    if object.errors[attribute].present?
      content_tag :div, object.errors[attribute].join(", "), class: 'text-danger'
    end
  end
end
