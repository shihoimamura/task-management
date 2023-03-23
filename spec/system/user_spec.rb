require 'rails_helper'
describe 'ユーザ機能', type: :system do
  describe 'ユーザ登録' do

    context 'ユーザの新規登録をした場合' do
      it "データベースにユーザーが追加される" do
        visit new_user_path
        fill_in "user_name", with: "baba"
        fill_in "user_email", with: "baba@com"
        fill_in "user_password", with: "password"
        fill_in "user_password_confirmation", with: "password"

        click_button "Create my account"

        expect(User.count).to eq 1
        expect(User.last.name).to eq 'baba'
      end
    end
    context 'ユーザがログインせずタスク一覧画面に飛ぼうとした場合' do
      it "ログイン画面に遷移する" do

        visit tasks_path
        expect(page).to have_content 'Log in'

      end
    end
  end

  describe 'セッション機能' do
      # 必要に応じて、テストデータの内容を変更して構わない
    let!(:user) {FactoryBot.create(:user)}
    let!(:second_user) {FactoryBot.create(:second_user)}
    let!(:third_user) {FactoryBot.create(:third_user)}

    context 'ログインをした場合' do
      it "個人のページに遷移する" do
        visit new_session_path
        fill_in "session_email", with: "bibi@com"
        fill_in "session_password", with: "bibibibi"

        click_button "Log in"

        expect(page).to have_content 'bibi@com'

      end
    end


    context '自分の詳細画面(マイページ)に飛んだ場合' do
      it "自分のメールアドレスが表示される" do
        visit new_session_path
        fill_in "session_email", with: "bibi@com"
        fill_in "session_password", with: "bibibibi"

        click_button "Log in"

        expect(page).to have_content 'bibi@com'

      end
    end

    context '一般ユーザが他人の詳細画面に飛んだ場合' do
      it "タスク一覧画面に遷移する" do
        visit new_session_path
        fill_in "session_email", with: "bibi@com"
        fill_in "session_password", with: "bibibibi"

        click_button "Log in"

        visit user_path(user)
        expect(page).to have_content 'タスク一覧'


      end
    end

    context 'ログアウトをした場合' do
      it "ログアウトしましたというメッセージが出る" do
        visit new_session_path
        fill_in "session_email", with: "bibi@com"
        fill_in "session_password", with: "bibibibi"

        click_button "Log in"
        click_link "Logout"
        expect(page).to have_content 'ログアウトしました'
      end
    end

    describe '管理画面のテスト' do

      let!(:user) {FactoryBot.create(:user)}
      let!(:second_user) {FactoryBot.create(:second_user)}
      let!(:third_user) {FactoryBot.create(:third_user)}

      context '管理ユーザは管理画面にアクセスした場合' do
        it "管理画面に遷移する" do
          visit new_session_path
          fill_in "session_email", with: "admin@com"
          fill_in "session_password", with: "admin_password"

          click_button "Log in"
          visit admin_users_path
          expect(page).to have_content 'ユーザー一覧'
        end
      end
      context '一般ユーザは管理画面にアクセスした場合' do
        it "管理画面にアクセスできない" do
          visit new_session_path
          fill_in "session_email", with: "bibi@com"
          fill_in "session_password", with: "bibibibi"

          click_button "Log in"
          visit admin_users_path
          expect(page).to have_content '管理者以外はアクセスできない'
        end
      end

      context '管理ユーザはユーザの新規登録をした場合' do
        it "データベースにユーザーが追加される" do
          visit new_session_path
          fill_in "session_email", with: "admin@com"
          fill_in "session_password", with: "admin_password"

          click_button "Log in"
          visit admin_users_path

          visit new_admin_user_path
          fill_in "user_name", with: "baba"
          fill_in "user_email", with: "baba@com"
          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"

          click_button "Create my account"

          expect(User.count).to eq 4
          expect(User.last.name).to eq 'baba'
        end
      end

      context '管理ユーザはユーザの詳細画面にアクセスした場合' do
        it "そのユーザーのメールアドレスが表示される" do
          visit new_session_path
          fill_in "session_email", with: "admin@com"
          fill_in "session_password", with: "admin_password"

          click_button "Log in"
          visit admin_users_path

          visit admin_user_path(user)
          expect(page).to have_content 'vivi@com'

        end
      end

      context '管理ユーザはユーザの編集画面からユーザを編集した場合' do
        it "ユーザの情報は変更される" do
          visit new_session_path
          fill_in "session_email", with: "admin@com"
          fill_in "session_password", with: "admin_password"

          click_button "Log in"
          visit admin_users_path
          visit edit_admin_user_path(user)
          fill_in "user_name", with: "jojojo"

          fill_in "user_password", with: "password"
          fill_in "user_password_confirmation", with: "password"
          click_button "Create my account"

          expect(page).to have_content 'jojojo'


        end
      end

      context '管理ユーザはユーザの削除をした場合' do
        it "データベースからそのユーザが削除される" do
          visit new_session_path
          fill_in "session_email", with: "admin@com"
          fill_in "session_password", with: "admin_password"

          click_button "Log in"
          visit admin_users_path

          first(".btn-danger").click

          expect(User.count).to eq 2
          expect(page).to_not have_content "vivi"

        end
      end
    end
  end
end
