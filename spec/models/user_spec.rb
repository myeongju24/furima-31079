require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    context '新規登録がうまくいくとき' do
      it "全ての必須事項を入力すれば登録できる" do
        user = User.new(nickname: "みょん", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        expect(user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicnameが空だと登録できない" do
        user = User.new(nickname: "", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "emailが空だと登録できない" do
        user = User.new(nickname: "ヤマダ", email: "", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("Email can't be blank")
      end

      it "パスワードが空だと登録できない" do
        user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("Password can't be blank")
      end

      it "お名前（全角名字）が空だと登録できない"do
        user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("Family name kanji can't be blank")
      end

      it "お名前(全角下の名前)が空だと登録できない" do
        user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("First name kanji can't be blank")
      end

      it "お名前(半角名字)が空だと登録できない" do
        user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("Family name kana can't be blank")
      end

      it "お名前(半角下の名前)が空だと登録できない" do
        user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("First name kana can't be blank")
      end

      it "誕生日が空だと登録できない" do
        user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "")
        user.valid?
        expect(user.errors.full_messages).to include("Birthday can't be blank")
      end
      
      it "パスワードは英数字混合じゃないといけない" do
        user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("Password には英字と数字の両方を含めて設定してください")
      end

      it "パスワードは６文字以上じゃないといけない" do
        user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "abc12", password_confirmation: "abc12", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "メールアドレスは、@を含む必要がある" do
      user = User.new(nickname: "ヤマダ", email: "kkkgmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
      end

      it "パスワードは一致していないといけない" do
        user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcde1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        user.valid?
        expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "重複したemailが存在する場合登録できない" do
        @user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        @user.save
        another_user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "abcd1234", password_confirmation: "abcd1234", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
    end
    
  end
end
