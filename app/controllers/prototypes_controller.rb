class PrototypesController < ApplicationController
# before_action :move_to_signed_in, expect: :index

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    prototype = Prototype.create(prototype_params)
    if prototype.save
      redirect_to root_path
    else
      prototype.save
      render :new, status: :unprocessable_entity
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  # def move_to_signed_in
  #   unless user_signed_in?
  #     redirect_to action: :index
  #   end
  # end
end
