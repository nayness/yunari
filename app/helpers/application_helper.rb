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

  def calculate_remaining_points(character)
    2500 - (character.power + character.attack + character.spirit + character.charisma + character.strenght)
  end
end
