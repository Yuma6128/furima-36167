require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

describe 'ユーザーの新規登録' do
  context '新規登録できるとき' do
  it 'すべての値が存在すれば登録できる'do
  expect(@user).to be_valid
  end
end
  context '新規登録できないとき' do
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
  it 'passwordが英字のみでは登録できない' do
    @user.password = 'testtest'
    @user.password_confirmation = 'testtest'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'passwordが数字のみでは登録できない' do
    @user.password = '123456'
    @user.password_confirmation = '123456'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'passwordが全角文字を含むときでは登録できない' do
    @user.password = 'Ｔesttest'
    @user.password_confirmation = 'Ｔesttest'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password is invalid")
  end
  it 'passwordが5文字以下だと登録できない' do
    @user.password = 'Test12'
    @user.password_confirmation = 'Test12'
    @user.valid?
    expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
  end
  it 'passwordとpassword確認の値が一致しないと登録できない' do
    @user.password = 'test123'
    @user.password_confirmation = 'test1234'
    @user.valid?
    expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
  end
  it 'お名前（姓）が半角だと登録できない' do
    @user.last_name = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name is invalid")
  end
  it 'お名前（名）が半角だと登録できない' do
    @user.first_name = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name is invalid")
  end
  it 'お名前（姓カナ）が半角だと登録できない' do
    @user.last_name_kana = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana is invalid")
  end
  it 'お名前（名カナ）が半角だと登録できない' do
    @user.first_name_kana = 'test'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
  end
  it 'お名前（カナ）がカナ以外だと登録できない' do
    @user.last_name_kana = '山田'
    @user.valid?
    expect(@user.errors.full_messages).to include("Last name kana is invalid")
  end
  it 'お名前（カナ）がカナ以外だと登録できない' do
    @user.first_name_kana = '太郎'
    @user.valid?
    expect(@user.errors.full_messages).to include("First name kana is invalid")
  end
  end
  end
end