class ObserverEventsController < ApplicationController
  def index
    @observer = current_observer
    @observer_events = current_observer.observer_events.all
  end

  def new
    @observer = current_observer
    @observer_new_event = ObserverEvent.new
  end

  def create
    @observer_new_event = ObserverEvent.new(observer_event_params)
    if @observer_new_event.save(observer_event_params)
      redirect_to observer_mypage_path(current_observer)
    else
      flash[:alert] = "保存できませんでした。タイトルを入力してください。"
      redirect_to request.referer
    end
  end

  def edit
    @observer = current_observer
    @observer_event = ObserverEvent.find(params[:id])
  end

  def update
    @observer_event = ObserverEvent.find(params[:id])
    if @observer_event.update(observer_event_params)
      redirect_to observer_mypage_path
    else
      flash[:alert] = "更新できませんでした"
      redirect_to request.referer
    end
  end

  def destroy
    @observer_event = ObserverEvent.find(params[:id])
    if @observer_event.destroy
      flash[:notice] = "削除しました！"
      redirect_to observer_mypage_path
    else
      flash[:alert] = "削除に失敗しました"
      redirect_to request.referer
    end
  end

  private
  def observer_event_params
    params.require(:observer_event).permit(:observer_id, :title, :event, :start_time, :end_time)
  end
end
