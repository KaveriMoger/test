class ClientsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index, :show]


  def index
   @client=Client.all
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
