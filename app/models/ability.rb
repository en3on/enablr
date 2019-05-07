# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #

    can :read, :all
    return unless user.present?

    can %i[create read], ProjectEnablr, user_id: user.id

    can :delete, ProjectEnablr do |enablr|
      enablr.can_refund? if user_id == user.id
    end

    can :manage, User, id: user.id

    can :manage, Comment do |comment|
      enablr = ProjectEnablr.find(comment.project_enablr_id)
      enablr.user_id == user.id
    end

    return unless user.fundraiser?

    can :manage, Project, user_id: user.id
    can %i[create update read], Perk do |perk|
      project = Project.find(perk.project_id)
      project.user_id == user.id
    end

    can :destroy, Perk do |perk|
      project = Project.find(perk.project_id)
      perk.enablr_amount.zero? if project.user_id == user.id
    end

    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end
