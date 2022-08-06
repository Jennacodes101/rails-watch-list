class ListsController < ApplicationController
  before_action :set_list, only: %i[before destroy]
  def index
    @lists = List.all
    @bookmarks = Bookmark.all
    @top_lists = List.order(:created_at).first(5)
  end

  def show
    @list = List.find(params[:id])
  end

  def new
    @list = List.new

  end

  def create
    @list = List.new(list_params)
    @list.save
    @list.user = current_user
    if @list.save
      redirect_to lists_path
    else
      render :new
    end
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end

  def set_list
    @list = List.find(params[:id])
  end
end
