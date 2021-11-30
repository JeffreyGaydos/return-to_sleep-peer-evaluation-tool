class PeerEvalController < ApplicationController

  def show
    @peer_eval = PeerEval.find(params[:id])
  end

  def form_view
    
    @peer_eval = PeerEval.new
    @users = User.all

  end

  def create
    puts params
    @peer_eval = PeerEval.new
    @peer_eval.score = params[:score]
    @peer_eval.comment = params[:comment]
    eval_user = User.find_by(id: params[:evaluated_user_id])
    @peer_eval.user = params[:evaluated_user_id]
        # if @peer_eval.save
    # end
  end
  
  private
    def peer_eval_params
      params.require(:peer_eval).permit!
    end

end
