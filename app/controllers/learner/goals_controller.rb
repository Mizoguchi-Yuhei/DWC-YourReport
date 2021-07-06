class GoalsController < ApplicationController
  def new
    @goal = Goal.new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.learner_id = current_learner.id
    if @goal.save
      redirect_to learner_mypage_path
    else
      flash.now[:alert] = "失敗しました。"
      render :new
    end
  end

  def edit
    @goal = Goal.find(params[:id])
  end

  def update
    @goal = Goal.find(params[:id])
    if @goal.update(goal_params)
      redirect_to learner_mypage_path
    else
      flash[:alert] = "入力してください。"
      redirect_to request.referer
    end
  end

  def destroy
    goal = Goal.find(params[:id])
    if goal.destroy
      redirect_to learner_mypage_path
      flash[:notice] = "削除しました"
    else
      redirect_to request.referer
    end
  end

  private

  def goal_params
    params.require(:goal).permit(:learner_id, :body)
  end
end
