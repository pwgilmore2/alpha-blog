class AuthorsController < ApplicationController
  
  def index
    @authors = Author.all
  end
  
  def show
    @author = Author.find(params[:id])
  end
  
  def new
    @author = Author.new()
  end
  
  def edit
    @author = Author.find(params[:id])
  end
  
  def create
    @author = Author.new(params.require(:author).permit(:first_name, :last_name, :biography))
    if @author.save
      flash[:notice] = "#{@author.first_name} was created successfully!"
      redirect_to @author
    else
      render 'new'
    end
  end
  
  def update
    @author = Author.find(params[:id])
    if @author.update(params.require(:author).permit(:first_name, :last_name, :biography))
      flash[:notice] = "#{@author.first_name} was updated successfully!"
      redirect_to @author
    else
      render 'edit'
    end
  end
end
