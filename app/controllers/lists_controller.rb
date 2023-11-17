class ListsController < ApplicationController
  before_action :grab_list, only: %i[show edit update destroy]

  def index
    @lists = List.all
  end

  def show; end

  def create
    @list = List.new(review_list)
    if @list.save
      redirect_to list_path(@list), status: :see_other
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @list = List.new
  end

  def edit; end

  def update
    @list.update(review_list)
    redirect_to list_path, status: :see_other
  end

  def destroy
    @list.destroy
    redirect_to list_path, status: :see_other
  end

  private

  def grab_list
    @list = List.find(params[:id])
  end

  def review_list
    params.require(:list).permit(:name) # maybe movies?

  end
end
