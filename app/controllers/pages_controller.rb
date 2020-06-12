class PagesController < ApplicationController

  def index
    @pages = Page.all # Load Page from database
  end

  def show
    # Show one specific page object
    @page = Page.find(params[:id])
  #  render text: params[:id]
  end

  def new
    @page = Page.new
  end

def create
  #page_params = params.require(:page).permit(:title, :body, :slug)
  @page = Page.new(page_params)
  @page.save
  redirect_to @page
end

def edit
  @page = Page.find(params[:id])
end

def update
  @page = Page.find(params[:id])
  #page_params = params.require(:page).permit(:title, :body, :slug)
  @page.update(page_params)
  redirect_to @page
end

def destroy
  @page = Page.find(params[:id])
  @page.destroy
end

  private

    def page_params
      params.require(:page).permit(:title, :body, :slug)
    end
end
