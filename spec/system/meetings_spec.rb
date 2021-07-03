require 'rails_helper'

RSpec.describe 'カレンダー予定作成', type: :system do
  before do
    @user = FactoryBot.create(:user)
    @meeting = FactoryBot.build(:meeting)
  end

  context 'カレンダー予定作成できる時'
  it 'ログインしたユーザーはカレンダー予定を作成して表示できる' do
    # サインインする
    sign_in(@user)
    # カレンダーページへのボタンがあることを確認する
    expect(page).to have_link('カレンダー')
    # カレンダーページに移動する
    visit meetings_path
    # カレンダー予定を作成するボタンがあることを確認する
    expect(page).to have_link('新規予定作成')
    # カレンダー予定作成ページへ移動する
    visit new_meeting_path
    # フォームに値を入力する
    select '2020', from: 'meeting[start_time(1i)]'
    select '1', from: 'meeting[start_time(2i)]'
    select '1', from: 'meeting[start_time(3i)]'
    fill_in 'meeting[name]', with: '予定作成'
    # 登録するとカレンダーモデルのカウントが1上がることを確認する
    expect  do
      find('input[name="commit"]').click
    end.to change { Meeting.count }.by(1)
    # 予定詳細ページに遷移していることを確認する
  end

  context 'カレンダー予定作成できない時' do
    it 'ログインしていない時にカレンダー予定を作成することができない' do
      # トップページに移動する
      visit root_path
      # カレンダーページへのボタンがfooterにあることを確認する
      expect(page).to have_content('カレンダー')
      # カレンダーページに移動するとログインページに遷移することを確認する
      visit meetings_path
      expect(current_path).to eq(new_user_session_path)
    end
    it 'ログインしていても入力フォームに値がない場合登録できない' do
      # サインインする
      sign_in(@user)
      # headerにカレンダーページへのボタンがあることを確認する
      expect(page).to have_link('カレンダー')
      # カレンダーページに移動する
      visit meetings_path
      # カレンダー予定作成ボタンがあることを確認する
      expect(page).to have_link('新規予定作成')
      # カレンダー予定作成ページに移動する
      visit new_meeting_path
      # meeting[name]だけを空にする
      select '2020', from: 'meeting[start_time(1i)]'
      select '1', from: 'meeting[start_time(2i)]'
      select '1', from: 'meeting[start_time(3i)]'
      fill_in 'meeting[name]', with: ''
      # DBに値が保存されていないことを確認する
      expect { find('input[name="commit"]').click }.not_to change { Meeting.count }
      # カレンダー予定作成ページに戻されていることを確認する
      expect(current_path).to eq '/meetings'
    end
  end
end
