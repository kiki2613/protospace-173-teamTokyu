class PrototypesController < ApplicationController
  before_action :move_to_signed_in, only: [:new, :create, :edit, :destroy]
  before_action :p_find, only: [:show, :edit, :update]
  before_action :different_id, only: [:edit]
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def edit   
  end

  def update
    if  @prototype.update(prototype_params)
        redirect_to prototype_path
    else
        render :edit, status: :unprocessable_entity
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_signed_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def p_find
    @prototype = Prototype.find(params[:id])
  end

  def different_id
    @prototype = Prototype.find(params[:id])
    if current_user.id != @prototype.user_id
      redirect_to root_path
    end
  end
end
