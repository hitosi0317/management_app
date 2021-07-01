require 'rails_helper'

RSpec.describe "Motions", type: :system do
  before do
    @user = FactoryBot.create(:user)
    @motion = FactoryBot.build(:motion)
  end
   
  context '予定入力できる時' do
    it 'ログインしたユーザーは予定を作成できて表示できる' do
     #サインインしてトップページに移動する。
     sign_in(@user)
     #予定作成ページへのボタンがあることを確認する
     expect(page).to have_content('本日の予定を設定する')
     #予定作成ページへ移動する
     visit new_motion_path
     #フォームに値を入力する
     fill_in 'motion_weight', with: @motion.weight
     fill_in 'motion_plans1', with: @motion.plans1
     fill_in 'motion_count1', with: @motion.count1
     fill_in 'motion_plans2', with: @motion.plans2
     fill_in 'motion_count2', with: @motion.count2
     fill_in 'motion_plans3', with: @motion.plans3
     fill_in 'motion_count3', with: @motion.count3
     fill_in 'motion_plans4', with: @motion.plans4
     fill_in 'motion_count4', with: @motion.count4
     fill_in 'motion_plans5', with: @motion.plans5
     fill_in 'motion_count5', with: @motion.count5
     fill_in 'motion_memo',   with: @motion.memo
    #送信するとmotionモデルのカウントが1上がることを確認する
    expect{
      find('input[name="commit"]').click
    }.to change { Motion.count}.by(1)
    #トップページに遷移することを確認する
    expect(current_path).to eq(root_path)
    #トップページに「本日の予定」というテキストがあることを確認する
    expect(page).to have_content('本日の予定')
    #トップページに先ほど作成した予定が存在することを確認する(テキスト)
    expect(page).to have_content(@motion.weight)
    expect(page).to have_content(@motion.plans1)
    expect(page).to have_content(@motion.count1.strftime('%H:%M') )
    expect(page).to have_content(@motion.plans2)
    expect(page).to have_content(@motion.count2.strftime('%H:%M'))
    expect(page).to have_content(@motion.plans3)
    expect(page).to have_content(@motion.count3.strftime('%H:%M'))
    expect(page).to have_content(@motion.plans4)
    expect(page).to have_content(@motion.count4.strftime('%H:%M'))
    expect(page).to have_content(@motion.plans5)
    expect(page).to have_content(@motion.count5.strftime('%H:%M'))
    expect(page).to have_content(@motion.memo)
    end
  end

  context '予定入力できない時' do
   it 'ログインしていないと予定作成ページに遷移できない' do
    #トップページに遷移する
    visit root_path
    #予定作成ページへのボタンがないことを確認する
    expect(page).to have_no_content('本日の予定を設定する')
   end

   it 'ログインしていても正しい情報を入力していないと登録できない' do
    #サインインしてトップページに移動する
    sign_in(@user)
     #予定作成ページへのボタンがあることを確認する
     expect(page).to have_content('本日の予定を設定する')
     #予定作成ページへ移動する
     visit new_motion_path
     #フォームに値を入力する
     fill_in 'motion_weight', with: ''
     fill_in 'motion_plans1', with: ''
     fill_in 'motion_count1', with: ''
     fill_in 'motion_plans2', with: ''
     fill_in 'motion_count2', with: ''
     fill_in 'motion_plans3', with: ''
     fill_in 'motion_count3', with: ''
     fill_in 'motion_plans4', with: ''
     fill_in 'motion_count4', with: ''
     fill_in 'motion_plans5', with: ''
     fill_in 'motion_count5', with: ''
     fill_in 'motion_memo',   with: ''
    #送信するとmotionモデルのカウントが上がらないことを確認する
     expect  do
      find('input[name="commit"]').click
    end.to change { Motion.count }.by(0)
    # 予定作成ページへ戻されることを確認する
    expect(current_path).to eq "/motions"
   end
  end

  
end
