require 'rails_helper'
RSpec.describe 'タスク管理機能', type: :system do
  describe '複数のラベルをつける機能' do
    context 'タスクに複数のラベルをつけた場合' do
      let!(:user) {FactoryBot.create(:user)}
      let!(:second_user) {FactoryBot.create(:second_user)}
      let!(:third_user) {FactoryBot.create(:third_user)}
      let!(:label) {FactoryBot.create(:label)}
      let!(:second_label) {FactoryBot.create(:second_label)}
      let!(:third_label) {FactoryBot.create(:third_label)}
      it 'タスクに複数のラベルが表示される' do

        visit new_session_path
        fill_in "session_email", with: "bibi@com"
        fill_in "session_password", with: "bibibibi"

        click_button "Log in"

        visit new_task_path
        fill_in "タイトル", with: "title1"
        fill_in "内容", with: "content1"

        select '高', from: 'task[priority]'
        select '着手中', from: 'task[status]'
        fill_in "task[enddate]", with: "002023-01-01"
        check '勉強'
        click_button "保存"

        expect(page).to have_content '勉強'

      end
    end
  end
end
