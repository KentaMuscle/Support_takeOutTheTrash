class HomeController < ApplicationController
  # ユーザがログインしていないと"show"にアクセスできない
  before_action :authenticate_user!, only: :show

  def index
  end

  def show
  end

  def get_current_location

  end

  def my_trash_rule

  end
end
