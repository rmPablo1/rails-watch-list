class PagesController < ApplicationController

  def home
    @list = List.new
    @lists = List.where(user: current_user)
  end
end
