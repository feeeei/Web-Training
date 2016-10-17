class UsersController < ApplicationController

  def mine
    if current_user
      @articles = current_user.article
    end
  end
end