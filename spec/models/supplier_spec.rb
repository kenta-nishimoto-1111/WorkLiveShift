require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @supplier = FactoryBot.build(:supplier)
  end

  describe 'ユーザー新規登録' do
    it 'company_nameとcompany_image、email、passwordとpassword_confirmationが存在すれば登録できる' do
      expect(@supplier).to be_valid
    end

    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
      @supplier.password = '000000'
      @supplier.password_confirmation = '000000'
      expect(@supplier).to be_valid
    end

    it 'company_nameが空では登録できない' do
      @supplier.company_name = ''
      @supplier.valid?
      expect(@supplier.errors.full_messages).to include("Company name can't be blank")
    end

    it 'emailが空では登録できない' do
      @supplier.email = ''
      @supplier.valid?
      expect(@supplier.errors.full_messages).to include("Email can't be blank")
    end

    it 'passwordが空では登録できない' do
      @supplier.password = ''
      @supplier.valid?
      expect(@supplier.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @supplier.password_confirmation = ''
      @supplier.valid?
      expect(@supplier.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it '重複したemailが存在する場合登録できない' do
      @supplier.save
      another_user = FactoryBot.build(:supplier)
      another_user.email = @supplier.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end

    it 'passwordが5文字以下では登録できない' do
      @supplier.password = '00000'
      @supplier.password_confirmation = '00000'
      @supplier.valid?
      expect(@supplier.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
  end
end
