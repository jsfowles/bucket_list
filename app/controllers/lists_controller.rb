class ListsController < ApplicationController
	before_action :list_instance, except: [:new, :index, :create]

  def index
  end

  def show
		commontator_thread_show(@list)
    @items = @list.items.paginate(page: params[:page], per_page: 5)
  end

  def new
  	@list = List.new
  end

  def create
  	@list = current_user.lists.new(list_params)
  	if @list.save
  		flash[:success] = 'List created successfully'
  		redirect_to list_path(@list)
  	else
  		flash[:danger] = @list.errors.full_messages.join('<br>').html_safe
  		render :new
  	end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      flash[:success] = 'List updated'
      redirect_to list_path(@list)
    else
      flash[:danger] = @list.errors.full_messages.join('<br>').html_safe
      render :edit
    end
  end

  def destroy
    @list.destroy
    flash[:success] = 'List deleted'
    redirect_to root_path
  end

  private

  def list_params
  	params.require(:list).permit(:name, :description)
  end

  def list_instance
  	@list = current_user.lists.find(params[:id])
  end
end
