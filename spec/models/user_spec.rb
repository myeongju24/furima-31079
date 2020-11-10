require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do

    it "nicnameが空だと登録できない" do
      user = User.new(nickname: "", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end

    it "emailが空だと登録できない" do
      user = User.new(nickname: "ヤマダ", email: "", password: "00000000", password_confirmation: "00000000", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end

    it "パスワードが空だと登録できない" do
      user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "", password_confirmation: "00000000", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it "お名前（全角名字）が空だと登録できない"do
      user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name_kanji: "", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
      user.valid?
      expect(user.errors.full_messages).to include("Family name kanji can't be blank")
    end

    it "お名前(全角下の名前)が空だと登録できない" do
      user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name_kanji: "山田", first_name_kanji: "", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
      user.valid?
      expect(user.errors.full_messages).to include("First name kanji can't be blank")
    end

    it "お名前(半角名字)が空だと登録できない" do
      user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "", first_name_kana: "タロウ", birthday: "1990-01-24 00:00:00")
      user.valid?
      expect(user.errors.full_messages).to include("Family name kana can't be blank")
    end

    it "お名前(半角下の名前)が空だと登録できない" do
      user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "", birthday: "1990-01-24 00:00:00")
      user.valid?
      expect(user.errors.full_messages).to include("First name kana can't be blank")
    end

    it "誕生日が空だと登録できない" do
      user = User.new(nickname: "ヤマダ", email: "kkk@gmail.com", password: "00000000", password_confirmation: "00000000", family_name_kanji: "山田", first_name_kanji: "太郎", family_name_kana: "ヤマダ", first_name_kana: "タロウ", birthday: "")
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end

  end
end
