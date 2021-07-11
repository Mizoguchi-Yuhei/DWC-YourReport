class Observer::LearnersController < ApplicationController
  def show
    @observer = current_observer
    @follow = Learner.find(params[:learner_id])
    @tests = @follow.tests.page(params[:tests_page]).per(2)
    @goals = @follow.goals.page(params[:goal_page]).per(5)
  end

  private

  def learner_params
    params.require(:learner).permit(:name)
  end

  def test_params
    params.require(:test).permit(:id, :learner_id, :name, :image, :pros, :cons, subjects_attributes: [:id, :test_id, :name, :score, :perfect, :average, :_destroy])
  end
end
