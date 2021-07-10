class Observer::TestsController < ApplicationController
  def show
    @observer = current_observer
    @follow = Learner.find_by(params[:learner_id])  # ここが

    @test = Test.find_by(params[:id], learner_id: @follow.id)
    @subjects = @test.subjects
    gon.name_list = @subjects.pluck(:name)
    gon.score_list = @subjects.pluck(:score)
    gon.average_list = @subjects.pluck(:average)
  end

  private

  def learner_params
    params.require(:learner).permit(:name)
  end

  def test_params
    params.require(:test).permit(:id, :learner_id, :name, :image, :pros, :cons, subjects_attributes: [:id, :test_id, :name, :score, :perfect, :average, :_destroy])
  end
end
