class ItemsController < ApplicationController
	before_action :list_instance
	before_action :item_instance, except: [:index, :new, :create]

  def index
  	@items = @list.items
  end

  def show
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = @list.items.new(items_params)
  	if @item.save
  		flash[:success] = "Item added successfully"
  		redirect_to list_path(@list)
  	else
  		flash[:danger] = @item.errors.full_messages.join('<br>').html_safe
  		render :new
  	end
  end

  def edit
  end

  def update
  	if @item.update(items_params)
  		flash[:success] = "Item updated successfully"
  		redirect_to list_path(@list)
  	else
  		flash[:danger] = @item.errors.full_messages.join('<br>').html_safe
  		render :edit
  	end
  end

  def destroy
  	@item.destroy
  	flash[:success] = 'Item removed successfully'
  	redirect_to list_path(@list)
  end

  private

  def items_params
  	params.require(:item).permit(:title, :complete_by, :completed)
  end

  def list_instance
  	@list = current_user.lists.find(params[:list_id])
  end

  def item_instance
  	@item = @list.items.find(params[:id])
  end
end
