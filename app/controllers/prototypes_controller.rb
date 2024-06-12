class PrototypesController < ApplicationController
  before_action :move_to_signed_in, only: [:new, :create]

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
    @prototype = Prototype.find(params[:id])
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
      @prototype = Prototype.find(params[:id])
    if  @prototype.update(prototype_params)
        redirect_to root_path
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
      redirect_to new_user_registration_path
    end
  end
end
