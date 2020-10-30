class GossipController < ApplicationController

  before_action :authenticate_user, only: [:new, :create]

  def show
    @gossipfind = Gossip.find(params[:id])
  end

  def index
    @gossip = Gossip.all
  end

  def new
    @gossip = Gossip.new
  end

  def create
    @gossip = Gossip.create('title' => params[:title],'content' => params[:content])
    @gossip.user = current_user
     if @gossip.save
      redirect_to @gossip
     else
      render 'new'
     end
  end

  def edit
    @gossip = Gossip.find(params[:id])
  end

  def update
    @gossip = Gossip.find(params[:id])
    gossip_params = params.require(:gossip).permit(:title,:content)
    if @gossip.update(gossip_params)
      redirect_to @gossip
     else
      render 'edit'
    end
  end

  def destroy
    @gossip = Gossip.find(params[:id])
    @gossip.destroy
    redirect_to root_path
  end
  
  private

  def authenticate_user
    unless current_user
      flash[:danger] = "Please log in."
      redirect_to new_session_path
    end
  end
end
