require 'rails_helper'

RSpec.describe 'ユーザーのプロフィール保存', type: :system do
  before do
    @supplier = FactoryBot.build(:supplier)
  end

  context '企業情報が保存できる時' do
    it '企業情報が保存できる時' do
      # 企業情報を登録する
      visit new_supplier_registration_path
      attach_file('supplier[company_image]', Rails.root.join('public/images/test_image.png'), make_visible: true)
      fill_in 'supplier[company_name]', with: @supplier.company_name
      fill_in 'supplier[email]', with: @supplier.email
      fill_in 'supplier[password]', with: @supplier.password
      expect  do
        find('input[name="commit"]').click
      end.to change { Supplier.count }.by(1)

      # ステップ２の画面に遷移し、情報を入力する
      expect(current_path).to eq second_step_supplier_companies_path
      select '大阪府', from: 'company[prefecture_id]'
      select '2000', from: 'company[founding_date(1i)]'
      select '11', from: 'company[founding_date(2i)]'
      fill_in 'company[phone_number]', with: '000000000'
      fill_in 'company[company_url]', with: 'http://test.com'
      find('input[name="commit"]').click
      expect(current_path).to eq third_step_supplier_companies_path

      # ステップ３の情報を入力する
      fill_in 'company[company_content]', with: 'company_content'
      find('input[name="commit"]').click
      expect(current_path).to eq fourth_step_supplier_companies_path

      # ステップ４の情報を入力する
      fill_in 'company[company_purpose]', with: 'company_purpose'
      find('input[name="commit"]').click
      expect(current_path).to eq fifth_step_supplier_companies_path

      # ステップ５の情報を入力する
      fill_in 'company[company_environment]', with: 'company_environment'
      find('input[name="commit"]').click
      expect(current_path).to eq sixth_step_supplier_companies_path

      # ステップ６の情報を入力する
      check '個人営業'
      find('input[name="commit"]').click
      expect(current_path).to eq double_check_supplier_companies_path

      # 入力した企業情報の確認画面に遷移し、問題なければ保存を実行
      expect(page).to have_content('大阪府')
      expect(page).to have_content('2000')
      expect(page).to have_content('11')
      expect(page).to have_content('000000000')
      expect(page).to have_content('http://test.com')
      expect(page).to have_content('company_content')
      expect(page).to have_content('company_environment')
      expect(page).to have_content('company_purpose')
      expect(page).to have_content('個人営業')
      expect  do
        find('input[name="commit"]').click
      end.to change { Company.count }.by(1)
    end
  end
end
