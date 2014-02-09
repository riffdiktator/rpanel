class Admin::PagesController < ApplicationController
	before_action :authenticate_user!
	
  def index
  	@pages = Page.all
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
    @Page_title = Page.find(params[:id]).title
    @Page_text = Page.find(params[:id]).text
    @Page_in_menu = Page.find(params[:id]).in_menu
    @Page_created = Page.find(params[:id]).created_at
    @Page_updated = Page.find(params[:id]).updated_at
  end

  def update
    @page = Page.find(params[:id])
    @page.update(page_params)
    if page_params[:save_and_leave]==1
      redirect_to admin_pages_url
    else
      redirect_to edit_admin_page_url(@page)
    end
  end

  private
	  def page_params
	    params.require(:page).permit(:title, :text, :in_menu)
	  end

end
