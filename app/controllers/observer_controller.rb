class ObserverController < ApplicationController
  def show
    @observer = current_observer
  end
end
