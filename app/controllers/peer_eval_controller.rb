class PeerEvalController < ApplicationController

  def show
    @peer_eval = PeerEval.find(params[:id])
  end

  def form_view
    
    @peer_eval = PeerEval.new
    @users = User.where(id: 1)

  end

  def create
    @peer_eval = PeerEval.new(peer_eval_params)
    if @peer_eval.save
    end
  
  end
  
  private
    def peer_eval_params
      params.require(:peer_eval).permit(:score, :comment, :evaluated_user)
    end

end
