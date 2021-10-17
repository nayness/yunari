class CharacterSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers
  attributes :name, :slug, :power, :attack, :strenght, :charisma, :spirit, :race, :kind, :public_url

  def race
    object.race&.name
  end

  def kind
    object.kind&.name
  end

  def public_url
    if Rails.env.development?
      "localhost:3000/#{personajes_path(object.slug)}"
    else
      "#{ENV['HOST']}/#{personajes_path(object.slug)}"
    end
  end
end
