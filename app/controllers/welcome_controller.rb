class WelcomeController < ApplicationController
  before_action :authenticate_member!
  def index
   	@member = Member.all
  end
end
