class PeerEvalController < ApplicationController

  def show
    @peer_eval = PeerEval.find(params[:id])
  end

  def form_view
    
    @peer_eval = PeerEval.new
    @users = User.all.select { |user| user.id != current_user[:id] }

  end

  def create
    puts params
    @peer_eval = PeerEval.new
    @peer_eval.score = params[:peer_eval][:score]
    @peer_eval.comment = params[:peer_eval][:comment]
    @peer_eval.user_id = params[:peer_eval][:evaluated_user_id]
    @peer_eval.team_id = 1
    @peer_eval.project_id = 1
    
    if @peer_eval.save!
      redirect_to "/users/#{current_user[:id]}"
    end
  end
  
  private
    def peer_eval_params
      params.require(:peer_eval).permit(:score, :comment, :user, :team, :project)
    end

end
