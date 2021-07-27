require 'rails_helper'

RSpec.describe DailyTest, type: :model do
  it "日々のテストを登録できる" do
  # 日々のテストを新規作成
  	daily_test = DailyTest.new(
  		name: "テスト",
  		score: "80"
  		)
  end
end
