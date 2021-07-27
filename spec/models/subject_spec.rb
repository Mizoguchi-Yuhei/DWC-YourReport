require 'rails_helper'

RSpec.describe Subject, type: :model do
  it "科目成績を登録できる" do
  # 定期テストの点数を登録
  	subject = Subject.new(
  		score: "75",
  		perfect: "100",
  		average: "70"
  		)
  end
end
