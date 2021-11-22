require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @post = FactoryBot.build(:post, user_id: @user.id)
  end

  describe '投稿機能' do
    context '投稿できる場合' do
      it '全てを正しく入力すれば投稿できる' do
        expect(@post).to be_vaild
      end
    end
  end 
end