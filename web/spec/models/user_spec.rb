require 'rails_helper'

RSpec.describe User, type: :model do
  let(:valid_user) { User.new(name: '山田太郎', email: 'taro@example.com', password: 'password', password_confirmation: 'password') }
  describe 'success create user' do
    it 'is valid user save' do
      expect(valid_user).to be_valid
    end
  end

  describe 'failed create user' do
    context 'nothing params' do
      before do
        @user = User.new()
        @user.valid?
      end

      it 'is invalid with nothing params' do
        expect(@user.errors).to be_key(:name)
        expect(@user.errors).to be_key(:email)
        expect(@user.errors).to be_key(:password)
        expect(@user.errors).to be_key(:password_confirmation)
      end
    end

    context 'not uniqu email' do
      before do
        valid_user.save
        @user = User.new(name: '山田太郎', email: 'taro@example.com', password: 'password', password_confirmation: 'password')
        @user.valid?
      end

      it 'is invalid with duplicate email' do
        expect(@user.errors).to be_key(:email)
      end
    end

    context 'not match passowrd and password_confirmation' do
      before do
        @user = User.new(name: '山田太郎', email: 'taro@example.com', password: 'password', password_confirmation: '12345678')
        @user.valid?
      end

      it 'is invalid with no match password' do
        expect(@user.errors).to be_key(:password_confirmation)
      end
    end
  end
end