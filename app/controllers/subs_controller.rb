class SubsController < ApplicationController
  before_action :ensure_moderator, only:[:edit]

  def index
    @subs = Sub.all
    render :index
  end

  def new
  end

  def create
    @sub = Sub.new(sub_params)
    @sub.creator_id = current_user.id
    if @sub.save
      redirect_to sub_url(@sub)
    else
      redirect_to new_sub_url
    end
  end

  def edit
    @sub = Sub.find_by_id(params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by_id(params[:id])
    if @sub.update(sub_params)
      redirect_to sub_url(@sub)
    else
      redirect_to edit_sub_url(@sub)
    end
  end

  def show
    @sub = Sub.find_by_id(params[:id])
    render :show
  end

  private
  def sub_params
    params.require(:sub).permit(:title, :description)
  end

  def ensure_moderator
    @sub = Sub.find_by_id(params[:id])
    current_user.id == @sub.creator_id
  end
end
