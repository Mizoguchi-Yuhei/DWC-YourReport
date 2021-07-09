class Observer::LearnersController < ApplicationController
  def show
    @learner = Learner.find(params[:id])
  end

  private

  def learner_params
    params.require(:learner).permit(:name)
  end

  def test_params
    params.require(:test).permit(:id, :learner_id, :name, :image, :pros, :cons, subjects_attributes: [:id, :test_id, :name, :score, :perfect, :average, :_destroy])
  end
end
