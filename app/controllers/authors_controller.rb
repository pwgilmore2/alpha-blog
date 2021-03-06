class AuthorsController < ApplicationController
  before_action  :set_author, only: [:show, :edit, :update, :destroy]
  
  def index
    @authors = Author.paginate(page: params[:page], per_page: 5)
  end
  
  def show
  end
  
  def new
    @author = Author.new()
  end
  
  def edit
  end
  
  def create
    @author = Author.new(author_params)
    @author.user = User.first
    if @author.save
      flash[:notice] = "#{@author.first_name} was created successfully!"
      redirect_to @author
    else
      render 'new'
    end
  end
  
  def update
    if @author.update(author_params)
      flash[:notice] = "#{@author.first_name} was updated successfully!"
      redirect_to @author
    else
      render 'edit'
    end
  end
  
  def destroy
    @author.destroy
    redirect_to authors_path
  end
  
  private
  
  def set_author
    @author = Author.find(params[:id])
  end
  
  def author_params
    params.require(:author).permit(:first_name, :last_name, :biography)
  end
  
end
