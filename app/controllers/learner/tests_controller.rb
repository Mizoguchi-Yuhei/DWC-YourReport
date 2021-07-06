class Learner::TestsController < ApplicationController
  def new
    @learner = Learner.find(params[:learner_id])
    @test = Test.new
    @subjects = @test.subjects.build
  end

  def create
    @test = Test.new(test_params)
    @test.save
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def test_params
    params.require(:test).permit(:name, subjects_attributes: [:id, :name, :_destroy])
  end

end
