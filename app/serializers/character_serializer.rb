class CharacterSerializer < ActiveModel::Serializer
  attributes :name, :slug, :power, :attack, :strenght, :charisma, :spirit, :race, :kind

  def race
    object.race&.name
  end

  def kind
    object.kind&.name
  end
end
