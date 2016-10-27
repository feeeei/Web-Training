require 'rails_helper'

describe User do
  it 'is valid with a email and password' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid without a email' do
    user = build(:user, email: nil)
    user.valid?
    expect(user.errors[:email]).to include("不能为空字符")
  end

  it 'has a valid factory' do
    expect(build(:user)).to be_valid
  end

  it 'is invalid with a duplicate email address' do
    create(:user, email: 'qwe@qwe.com')
    user = build(:user, email: 'qwe@qwe.com')
    user.valid?
    expect(user.errors[:email]).to include('已经被使用')
  end

end