require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザーの新規登録' do
  it 'メールが空では登録できない。' do
    @user.email = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Email can't be blank")
end
it '重複したemailが存在する場合登録できない' do
  @user.save
  another_user =FactoryBot.build(:user)
  another_user.email = @user.email
  another_user.valid?
  expect(another_user.errors.full_messages).to include('Email has already been taken')
  end

it 'emailに@が含まれていない場合登録できない' do
  @user.email = 'test'
  @user.valid?
  expect(@user.errors.full_messages).to include('Email is invalid')
    end
  it 'passwordが空では登録できない' do
    @user.password = ''
    @user.valid?
    expect(@user.errors.full_messages).to include("Password can't be blank")
  end
  it 'passwordが5文字以下だと登録できない' do
    @user.password = '12345'
    @user.password_confirmation = '12345'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordとpassword確認の値が一致しないと登録できない' do
    @user.password = 'test123'
    @user.password_confirmation = 'test1234'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  end
end