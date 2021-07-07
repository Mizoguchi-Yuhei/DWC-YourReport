class Learner::TestsController < ApplicationController
  def new
    @learner = current_learner
    @test = Test.new
    @test.subjects.build
  end

  def create
    @test = Test.new(test_params)
    if @test.save(test_params)
      redirect_to learner_mypage_path(current_learner)
    else
      flash[:alert] = "失敗しました。"
      redirect_to request.referer
    end
  end

  def show
    @test = Test.find_by(params[:id], learner_id: current_learner.id)
    @subjects = Subject.where(test_id: @test.id)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def test_params
    params.require(:test).permit(:learner_id, :name, :image, :pros, :cons, subjects_attributes: [:test_id, :name, :score, :perfect, :average, :_destroy])
  end

end
