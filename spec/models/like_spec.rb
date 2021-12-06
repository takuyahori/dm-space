require 'rails_helper'

RSpec.describe Like, type: :model do
  before do
    @like = FactoryBot.build(:like)
  end

  describe "いいね投稿" do
    context "いいねを投稿できた場合" do
      it "全ての項目が入力されてれば保存できる" do
        expect(@like).to be_valid
      end
    end
    context "いいねを投稿できない場合" do
      it "post_idが紐づいていないと投稿できない" do
        @like.post = nil
        @like.valid?
        expect(@like.errors.full_messages).to include("Post must exist")
      end
    end
  end
end
