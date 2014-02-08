class Admin::PagesController < ApplicationController
	before_action :authenticate_user!
	
  def index
  end

  def new
  end

  def create
  	@page = Page.new(page_params)
    @page.save
    flash[:notice] = "Post successfully created"
    redirect_to admin_pages_url
  end
  
  def edit
  end

  private
	  def page_params
	    params.require(:page).permit(:title, :text, :in_menu)
	  end

end
