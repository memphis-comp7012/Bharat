module ApplicationHelper
  def current_class?(test_path)
    return 'active' if request.path == test_path
    ''
  end

  def get_css_class_by_status(status)
    case status
      when 1
        class_name = 'info'
      when 2
        class_name = 'warning'
      when 3
        class_name = 'success'
      else
        class_name = 'default'
    end

    return class_name
  end

  def display_error_messages(resource)
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
                      count: resource.errors.count,
                      resource: resource.class.model_name.human.downcase)

    html = <<-HTML
    <div class="alert alert-danger m-t-15">
      <button type="button" class="close" data-dismiss="alert">x</button>
      <h4><span class="glyphicon glyphicon-exclamation-sign"></span> #{sentence}</h4>
      #{messages}
    </div>
    HTML

    html.html_safe
  end
end