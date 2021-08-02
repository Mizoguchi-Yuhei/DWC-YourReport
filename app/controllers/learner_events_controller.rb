class LearnerEventsController < ApplicationController
  def index
    @learner = current_learner
    @learner_events = current_learner.learner_events.all
  end

  def new
    @learner = current_learner
    @learner_new_event = LearnerEvent.new
  end

  def create
    @learner_new_event = LearnerEvent.new(learner_event_params)
    if @learner_new_event.save(learner_event_params)
      redirect_to learner_mypage_path(current_learner)
    else
      flash[:alert] = "保存できませんでした"
      redirect_to request.referer
    end
  end

  def edit
    @learner = current_learner
    @learner_event = LearnerEvent.find(params[:id])
  end

  def update
    @learner_event = LearnerEvent.find(params[:id])
    if @learner_event.update(learner_event_params)
      redirect_to learner_mypage_path
    else
      flash[:alert] = "更新できませんでした"
      redirect_to request.referer
    end
  end

  def destroy
    @learner_event = LearnerEvent.find(params[:id])
    if @learner_event.destroy
      flash[:notice] = "削除しました！"
      redirect_to learner_mypage_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to request.referer
    end
  end

  private
  def learner_event_params
    params.require(:learner_event).permit(:learner_id, :title, :event, :start_time, :end_time)
  end
end
