class HomeController < ApplicationController
  before_action:forbid_user, {only: [:history, :member, :photo]}

  def top
  end

  def history
  end

  def member
  end

  def photo
  end


end
