class TeamsController < ApplicationController
  def index
   @team=Team.all
  end

  def new
   @team=Team.new
  end

 def edit
  @team=Team.find(params[:id])
 end

  def create
   @team=Team.new(team_params)
   if @team.save
   redirect_to @team
    else
   render 'new'
   end
  end
  
  def show
  @team=Team.find(params[:id])
  end

  def update
   @team=Team.find(params[:id])
   if @team.update(team_params)
    redirect_to @team
    else
    redirect_to 'edit'
   end
  end

 def destroy
  @team=Team.find(params[:id])
  @team.destroy

  redirect_to teams_path,notice: "the team #{@team.tema_name} has been deleted."
 end

private 
 def team_params
 params.require(:team).permit(:team_name, :team_head, :summary)
 end
end
