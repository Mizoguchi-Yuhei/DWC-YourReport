class Observer::LearnersController < ApplicationController
  def show
    @observer = current_observer
    @follow = Learner.find(params[:id])
    @goals = @follow.goals.order("created_at DESC").page(params[:goal_page]).per(3)
    @tests = @follow.tests.order("created_at DESC").page(params[:tests_page]).per(2)
    @daily_tests = @follow.daily_tests.order("created_at DESC").page(params[:daily_tests_page]).per(2)
  end

  private

  def learner_params
    params.require(:learner).permit(:id,:name)
  end

  def test_params
    params.require(:test).permit(:id, :learner_id, :name, :image, :pros, :cons, subjects_attributes: [:id, :test_id, :name, :score, :perfect, :average, :_destroy])
  end

  def daily_test_params
    params.require(:daily_test).permit(:id, :learner_id, :name, daily_scores_attributes: [:id, :daily_test_id, :name, :score, :_destroy])
  end
end
