require 'rails_helper'

RSpec.describe 'ユーザーのプロフィール保存', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  context 'ユーザープロフィールが保存ができるとき'do
    it 'ログインしたユーザーはプロフィールの保存ができる' do
      # ログインする
      visit new_user_session_path
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]', with: @user.password
      find('input[name="commit"]').click
      expect(current_path).to eq root_path

      # ログインが成功しヘッダーにログアウトがあることを確認
      expect(page).to have_content('ログアウト')
      
      # ユーザー詳細に移動する
      visit user_path(@user)
      
      # ユーザー詳細画面に遷移し、基本情報が未記入であることを確認
      expect(page).to have_content('情報は未記入です！')

      # ユーザープロフィールの登録画面へに移動する
      visit new_profile_path
      
      # ユーザープロフィールの登録画面へに移動しているのかを確認する
      expect(page).to have_content('基本情報を追加する')
      
      # 基本情報を入力し、profileモデルのカウントが増えることを確認する
      select '1993', from: 'profile[birth_date(1i)]'
      select '11', from: 'profile[birth_date(2i)]'
      select '4', from: 'profile[birth_date(3i)]'
      select '大阪府', from: 'profile[prefecture_id]'
      fill_in 'profile[strong_point]', with: "test_strong_point"
      fill_in 'profile[dream]', with: "test_dream"
      expect{
        find('input[name="commit"]').click
      }.to change { Profile.count }.by(1)

      # ユーザー詳細に遷移していることを確認する
      expect(current_path).to eq user_path(@user)

      # 先程の情報が表示されていることを確認する
      expect(page).to have_content(1993)
      expect(page).to have_content(11)
      expect(page).to have_content(4)
      expect(page).to have_content('大阪府')
      expect(page).to have_content('test_strong_point')
      expect(page).to have_content('test_dream')

      # すでに保存されている状態でプロフィール画面に遷移すると編集画面にリダイレクトされる
      visit new_profile_path
      expect(current_path).to eq edit_profile_path(@user.profile.id)
      expect(page).to have_content('基本情報を変更する')
    end
  end

  context 'プロフィールが投稿ができないとき'do
    it 'ログインしていないとユーザー詳細ページに遷移できず、ログイン画面に遷移される' do
      @user = FactoryBot.create(:user)
      # トップページに遷移する
      visit user_path(@user)
      # 新規投稿ページへのリンクがない
      expect(current_path).to eq new_user_session_path
    end

    it '基本情報が空の場合は保存できず、プロフィール登録画面に遷移される' do
            # ログインする
            visit new_user_session_path
            fill_in 'user[email]', with: @user.email
            fill_in 'user[password]', with: @user.password
            find('input[name="commit"]').click
            expect(current_path).to eq root_path
      
            # ログインが成功しヘッダーにログアウトがあることを確認
            expect(page).to have_content('ログアウト')
            
            # ユーザー詳細に移動する
            visit user_path(@user)
            
            # ユーザー詳細画面に遷移し、基本情報が未記入であることを確認
            expect(page).to have_content('情報は未記入です！')
      
            # ユーザープロフィールの登録画面へに移動する
            visit new_profile_path
            
            # ユーザープロフィールの登録画面へに移動しているのかを確認する
            expect(page).to have_content('基本情報を追加する')
            
            # 基本情報を入力し、profileモデルのカウントが増えることを確認する
            select '1993', from: 'profile[birth_date(1i)]'
            select '11', from: 'profile[birth_date(2i)]'
            select '4', from: 'profile[birth_date(3i)]'
            select '大阪府', from: 'profile[prefecture_id]'
            fill_in 'profile[strong_point]', with: ""
            fill_in 'profile[dream]', with: ""
            expect{
              find('input[name="commit"]').click
            }.to change { Profile.count }.by(0)
      
            # ユーザー詳細に遷移していることを確認する
            expect(current_path).to eq "/profiles"
    end
  end
end