class UserController < ApplicationController
  def show
    @userfind = User.find(params[:id])
  end
  def index
    @user = User.all
  end

  def new
    @user = User.new
    @city = City.new
  end

  def create
    @city = City.find_or_create_by(name: params[:city])
    @user = User.create('first_name' => params[:first_name], 'last_name' => params[:last_name], 'email' => params[:email], 'age' => params[:age].to_i, 'description' => params[:description], 'city' => @city, 'password' => params[:password], 'password_confirmation' => params[:password_confirmation])
     if @user.save && @city.save
      flash[:notice] = "Post successfully created"
      redirect_to @user
     else
      render 'new'
     end
  end
end
