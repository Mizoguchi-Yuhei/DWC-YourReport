require 'rails_helper'

RSpec.describe Goal, type: :model do
  it "目標を登録できる" do
  # 目標を新規作成
  	goal = Goal.new(
  		body: "テスト"
  		)
  end
end
