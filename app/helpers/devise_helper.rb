# Custom modification for devise's error messages to use bootstrap styling
module DeviseHelper
  def devise_error_messages!
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