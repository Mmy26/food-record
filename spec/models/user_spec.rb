require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  describe "ユーザー新規登録" do
    context '新規登録できる場合' do
      it '全てを正しく入力すれば投稿できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it "ニックネームが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "ニックネーム が空では登録できません"
      end
      it "パスワードが空だと登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード が空では登録できません"
      end
      it "体重が空だと登録できない" do
        @user.weight = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "体重 が空では登録できません"
      end
      it "年齢が空だと登録できない" do
        @user.age = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "年齢 が空では登録できません"
      end
      it "性別が空だと登録できない" do
        @user.sex = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "性別 が空では登録できません"
      end
      it "身長が空だと登録できない" do
        @user.height = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "身長 が空では登録できません"
      end

      it 'emailに@が含まれていない場合登録できない' do
        @user.email = 'hogehoge.com'
        @user.valid?
        expect(@user.errors.full_messages).to include('メールアドレス の形が正しくありません (例:test@test)')
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include 'メールアドレス はすでに登録されています'
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード 短すぎます(6文字以上)'
      end
      it 'パスワードは、半角英数字混合でなければ登録できない' do
        @user.password = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード には英字と数字の両方を含めて設定してください'
      end
      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'Ａaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード には英字と数字の両方を含めて設定してください'
      end
      it '数字のみのパスワードでは登録できない' do
        @user.password = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include 'パスワード には英字と数字の両方を含めて設定してください'
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password_confirmation = !@user.password
        @user.valid?
        expect(@user.errors.full_messages).to include "パスワード（確認用） とパスワードが一致していません"
      end
    end
  end
end
