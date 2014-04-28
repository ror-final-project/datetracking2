class InboxController < ApplicationController
	include Mandrill::Rails::WebHookProcessor
	
  def new
  end

  def create
  end
end
