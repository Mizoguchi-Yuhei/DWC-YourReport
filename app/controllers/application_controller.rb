class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    case  resource
    when Learner
      learner_mypage_path
    when Observer
      observer_mypage_path
    end
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end

  protected

  def configure_permitted_parameters
    # サインアップ時にname登録
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    # 登録情報編集時 name変更可
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end
end
