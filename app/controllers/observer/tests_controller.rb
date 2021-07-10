class Observer::TestsController < ApplicationController
  def show
    @observer = current_observer
    @follow = Learner.find_by(params[:learner_id])
    @test = Test.find_by(params[:test_id], learner_id: @follow.id)
    @subjects = Subject.where(test_id: @test.id)
    gon.name_list = @subjects.pluck(:name)
    gon.score_list = @subjects.pluck(:score)
    gon.average_list = @subjects.pluck(:average)
  end
end
