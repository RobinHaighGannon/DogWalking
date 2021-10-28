# frozen_string_literal: false

# contains all of the methods for the welcome page
class WelcomeController < ApplicationController
  def index
    redirect_to homepage_index_path if params[:username] == 'Dogwalking' && params[:password] == 'pawsome'
  end
end
