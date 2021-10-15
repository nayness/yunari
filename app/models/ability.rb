# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    if user.has_role? :admin
      can :manage, :all
    elsif user.has_role? :standard
      can :manage, Character
      can :manage, User
    else
      can :read, Character
    end
  end
end
