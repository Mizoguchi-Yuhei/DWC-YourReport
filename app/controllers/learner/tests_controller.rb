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
      flash[:alert] = "テスト名・科目・得点・満点は入力してください"
      redirect_to request.referer
    end
  end

  def show
    @test = Test.find_by(id: params[:id], learner_id: current_learner.id)
    @subjects = Subject.where(test_id: params[:id])
    gon.name_list = @subjects.pluck(:name)
    gon.score_list = @subjects.pluck(:score)
    gon.average_list = @subjects.pluck(:average)
    gon.perfect_list = @subjects.pluck(:perfect)
  end

  def edit
    @test = Test.find_by(id: params[:id], learner_id: current_learner.id)
    @learner = current_learner
  end

  def update
    @test = Test.find(params[:test][:id])
    if @test.update(test_params)
      flash[:notice] = "更新しました！"
      @tests = current_learner.tests.all
      redirect_to learner_mypage_path
    else
      flash[:alert] = "テスト名・科目・得点・満点は入力してください"
      redirect_to request.referer
    end
  end

  def destroy
    @test = Test.find_by(id: params[:id], learner_id: current_learner.id)
    if @test.destroy
      flash[:notice] = "#{@test.name}を削除しました！"
      redirect_to learner_mypage_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to request.referer
    end
  end

  private
    # attributesでネストに対応
  def test_params
    params.require(:test).permit(:id, :learner_id, :name, :image, :pros, :cons, subjects_attributes: [:id, :test_id, :name, :score, :perfect, :average, :_destroy])
  end

end
