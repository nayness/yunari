module ApplicationHelper
  def translate_title(type)
    case type
    when 'success'
      'Éxito'
    when 'info'
      'Información'
    when 'danger'
      'Error'
    else
      'Mensaje'
    end
  end
end
