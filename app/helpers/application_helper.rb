module ApplicationHelper
  def flash_alert_class(name)
    case name.to_s
    when 'alert'
      'alert-danger'
    when 'notice'
      'alert-info'
    else
      name.to_s
    end
  end
end
