require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe "コメント投稿" do
    context "コメント投稿できる場合" do
      it "全ての項目が入力されていれば投稿できる" do
        expect(@comment).to be_valid
      end
    end
    context "コメント投稿できない場合" do
      it "nicknameが空の場合は登録できない" do
        @comment.nickname = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Nickname can't be blank")
      end
      it "textが空の場合は登録できない" do
        @comment.text = ''
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Text can't be blank")
      end
      it "post_idが紐づいていないと登録できない" do
        @comment.post = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include("Post must exist")
      end
    end
  end
end
