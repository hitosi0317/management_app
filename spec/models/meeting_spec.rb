require 'rails_helper'

RSpec.describe Meeting, type: :model do
  before do
    @meeting = FactoryBot.build(:meeting)
  end

  describe '予定登録' do
    context '予定登録できる時' do
      it 'start_timeとnameがあれば登録できる' do
        expect(@meeting).to be_valid
      end
    end

    context '予定登録できない時' do
      it 'nameがなければ登録できない' do
        @meeting.name = ''
        @meeting.valid?
        expect(@meeting.errors.full_messages).to include 'Nameを入力してください'
      end
    end
  end
end
