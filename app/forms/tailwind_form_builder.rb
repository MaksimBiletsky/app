class TailwindFormBuilder < ActionView::Helpers::FormBuilder
  # include ActionView::Helpers::TagHelper
  # include ActionView::Context

  def error_field(attribute, _options = {})
    msg = @object.errors.include?(attribute) ? @object.errors.full_messages_for(attribute).first : ""
    @template.content_tag(:div, msg, class: "h-5 text-sm text-red-500")
  end
end
