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
    @test = Test.find_by(id: params[:id], learner_id: current_learner.id)
    @subjects = Subject.where(test_id: params[:id])
    gon.name_list = @subjects.pluck(:name)
    gon.score_list = @subjects.pluck(:score)
    gon.average_list = @subjects.pluck(:average)
    # 満点
    # gon.perfect_list = @subjects.pluck(:perfect)
  end

  def edit
    @test = Test.find_by(id: params[:id], learner_id: current_learner.id)
    @learner = current_learner
  end

  def update
    binding.pry
    if @test.update(test_params)
      flash[:notice] = "更新しました！"
      redirect_to :show
    else
      flash[:alert] = "保存に失敗しました"
      redirect_to request.referer
    end
  end

  def destroy
    @test = Test.find_by(id: params[:id], learner_id: current_learner.id)
    if @test.destroy
      flash[:notice] = "削除しました！"
      redirect_to learner_mypage_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to request.referer
    end
  end

  private
  def test_params
    params.require(:test).permit(:id, :learner_id, :name, :image, :pros, :cons, subjects_attributes: [:id, :test_id, :name, :score, :perfect, :average, :_destroy])
  end

end
