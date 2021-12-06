class PeerEvalController < ApplicationController

  # def show
  #   @peer_eval = PeerEval.find(params[:id])
  #   @users = User.all.select { |user| user.id != current_user[:id] }
  # end

  def index
    @peer_evals = PeerEval.all.select { |eval| eval.project_id == params[:project_id].to_i }
    @project_num = params[:project_id]
    @users = User.all
    @new = "/teams/1/projects/1/peer_eval/new"
    @current_user = current_user
  end

  def new
    
    @peer_eval = PeerEval.new
    # filter out by peer evals that already exist as well as current user, need to filter to ones just within team
    @users = User.all.select { |user| user.id != current_user[:id] && !PeerEval.exists?(user_id: user.id) }

  end

  def create

    @peer_eval = PeerEval.new # create new peer eval object
    @peer_eval.score = params[:peer_eval][:score] # add score from form
    @peer_eval.comment = params[:peer_eval][:comment] # add comment from form
    evaluated_user_id = params[:peer_eval][:evaluated_user_id]
    @peer_eval.user_id =  evaluated_user_id # add evaluated user from dropdown
    @peer_eval.team_id = params[:team_id] # add team id from url params
    @peer_eval.project_id = params[:project_id] # add project id from url params
    
    # Removed this check cause we are already filtering out existing peer evals
    if PeerEval.exists?(user_id: evaluated_user_id)
      flash[:alert] = "ERROR: Peer evaluation already exists for this user"
    elsif @peer_eval.save!
      redirect_to "/teams/#{params[:team_id]}/projects/#{params[:project_id]}/peer_eval"
    end
  end
  
  private
    def peer_eval_params
      params.require(:peer_eval).permit(:score, :comment, :user, :team, :project)
    end

end
