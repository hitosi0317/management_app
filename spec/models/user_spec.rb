require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる時' do
      it 'nicknameとemailとpassword,password_confirmation,があれば登録できる' do
        expect(@user).to be_valid
      end

      it 'nicknameがあれば登録できる' do
        @user.nickname
        expect(@user).to be_valid
      end

      it 'emailがあれば登録できる' do
        @user.email
        expect(@user).to be_valid
      end

      it 'passwordとpassword_confimationが6文字以上で尚且つ同じだと登録できる' do
        @user.password
        @user.password_confirmation
        expect(@user).to be_valid
      end
    end
  end

  context '新規登録できない時' do
    it 'nicknameが空では登録できない' do
      binding.pry
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end

    it 'nicknameが11文字以上だと登録できない' do
      @user.nickname = '12345678901'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Nickname is too long (maximum is 10 characters)'
    end

    it 'emailが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end

    it 'emailに＠がないと登録できない' do
      @user.email = 'hogegmail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include 'Email is invalid'
    end

    it 'passwordが5文字以下だと登録できない' do
      @user.password = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password",
                                                    'Password is too short (minimum is 6 characters)'
    end

    it 'passwordが存在してもpassword_confimationがなければ登録できない' do
      @user.password
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end

    it 'passwordとpassword_confimationの値が違う場合は登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
  end
end
