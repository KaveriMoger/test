class ClientsController < ApplicationController
  before_filter :authorize, :except => [:index, :show]
  before_action :current_user, :except => [:new, :create]
  before_action :admin_only, :only => [:destroy]

  def index
    @client=Client.all
    @client=Client.search(params[:search])
  end

  def new
    @client=Client.new
  end

  def show
    @client=Client.find(params[:id])
  end

  def update
    @client=Client.find(params[:id])

    if @client.update(client_params)
      redirect_to @client
    else
      render 'edit'
    end
  end

  def edit
    @client=Client.find(params[:id])
  end

  def create
    @client=Client.new(client_params)
    if @client.save
      redirect_to @client
    else
      render 'new'
    end
  end

  def destroy
    @client=Client.find(params[:id])
    @client.destroy
    redirect_to clients_path, notice: "the client #{@client.c_name} has been deleted."
  end
  private
  def client_params
    params.require(:client).permit(:c_name, :c_email, :c_website, :c_country)
  end

end
