class Learner::DailyTestsController < ApplicationController
  def new
    @learner = current_learner
    @daily_test = DailyTest.new
    @daily_test.daily_scores.build
  end

  def create
    @daily_test = DailyTest.new(daily_test_params)
    if @daily_test.save(daily_test_params)
      redirect_to learner_mypage_path(current_learner)
    else
      flash[:alert] = "テスト名・得点を入力してください"
      redirect_to request.referer
    end
  end

  def show
    @daily_test = DailyTest.find_by(id: params[:id], learner_id: current_learner.id)
    @daily_scores = DailyScore.where(daily_test_id: params[:id])
    gon.name_list = @daily_scores.pluck(:name)
    gon.score_list = @daily_scores.pluck(:score)
  end

  def edit
    @daily_test = DailyTest.find_by(id: params[:id], learner_id: current_learner.id)
    @learner = current_learner
  end

  def update
    @daily_test = DailyTest.find(params[:daily_test][:id])
    if @daily_test.update(daily_test_params)
      flash[:notice] = "更新しました！"
      @daily_tests = current_learner.daily_tests.all
      redirect_to learner_mypage_path
    else
      flash[:alert] = "テスト名・得点は入力してください"
      redirect_to request.referer
    end
  end

  def destroy
    @daily_test = DailyTest.find_by(id: params[:id], learner_id: current_learner.id)
    if @daily_test.destroy
      flash[:notice] = "#{@daily_test.name}を削除しました！"
      redirect_to learner_mypage_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to request.referer
    end
  end

  private
  # attributesでネストに対応
  def daily_test_params
    params.require(:daily_test).permit(:id, :learner_id, :name, :score, daily_scores_attributes: [:id, :daily_test_id, :name, :score, :_destroy])
  end

end
