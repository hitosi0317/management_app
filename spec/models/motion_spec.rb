require 'rails_helper'

RSpec.describe Motion, type: :model do
<<<<<<< Updated upstream
  pending "add some examples to (or delete) #{__FILE__}"
=======
  before do
    @motion = FactoryBot.build(:motion)
  end

  describe '予定登録' do
    context '予定登録できる時' do
      it 'weightとplasn1とcount1があれば登録できる' do
        @motion.weight
        @motion.plans1
        @motion.count1
        expect(@motion).to be_valid
      end
      it 'plans2とcount2がなくても登録できる' do
        @motion.plans2 = ''
        @motion.count2 = ''
        expect(@motion).to be_valid
      end
      it 'plans3とcount3がなくても登録できる' do
        @motion.plans3 = ''
        @motion.count3 = ''
        expect(@motion).to be_valid
      end
      it 'plans4とcount4がなくても登録できる' do
        @motion.plans4 = ''
        @motion.count4 = ''
        expect(@motion).to be_valid
      end
      it 'plans5とcount5がなくても登録できる' do
        @motion.plans5 = ''
        @motion.count5 = ''
        expect(@motion).to be_valid
      end
      it 'memoがなくても登録できる' do
        @motion.memo
        expect(@motion).to be_valid
      end
    end

    context '予定登録できない時' do
      it 'weightがなければ登録できない' do
        @motion.weight = ''
        @motion.valid?
        expect(@motion.errors.full_messages).to include '体重は数値で入力してください'
      end
      it 'plans1とcount1がなければ登録できない' do
        @motion.plans1 = ''
        @motion.count1 = ''
        @motion.valid?
        expect(@motion.errors.full_messages).to include '一項目以上を入力してください', '時刻を入力してください'
      end
      it 'plans1があってもcount1がなければ登録できない' do
        @motion.plans1
        @motion.count1 = ''
        @motion.valid?
        expect(@motion.errors.full_messages).to include '時刻を入力してください'
      end
      it 'count1があってもplans1がなければ登録できない' do
        @motion.plans1 = ''
        @motion.count1
        @motion.valid?
        expect(@motion.errors.full_messages).to include '一項目以上を入力してください'
      end
      it 'plans2があってもcount2がなければ登録できない' do
        @motion.plans2
        @motion.count2 = ''
        @motion.valid?
        expect(@motion.errors.full_messages).to include 'Count2を入力してください'
      end
      it 'count2があってもplans2がなければ登録できない' do
        @motion.plans2 = ''
        @motion.count2
        @motion.valid?
        expect(@motion.errors.full_messages).to include 'Plans2を入力してください'
      end
      it 'plans3があってもcount3がなければ登録できない' do
        @motion.plans3
        @motion.count3 = ''
        @motion.valid?
        expect(@motion.errors.full_messages).to include 'Count3を入力してください'
      end
      it 'count3があってもplans2がなければ登録できない' do
        @motion.plans3 = ''
        @motion.count3
        @motion.valid?
        expect(@motion.errors.full_messages).to include 'Plans3を入力してください'
      end
      it 'plans4があってもcount3がなければ登録できない' do
        @motion.plans4
        @motion.count4 = ''
        @motion.valid?
        expect(@motion.errors.full_messages).to include 'Count4を入力してください'
      end

      it 'count4があってもplans4がなければ登録できない' do
        @motion.plans4 = ''
        @motion.count4
        @motion.valid?
        expect(@motion.errors.full_messages).to include 'Plans4を入力してください'
      end
      it 'plans5があってもcount5がなければ登録できない' do
        @motion.plans5
        @motion.count5 = ''
        @motion.valid?
        expect(@motion.errors.full_messages).to include 'Count5を入力してください'
      end
      it 'count5があってもplans5がなければ登録できない' do
        @motion.plans5 = ''
        @motion.count5
        @motion.valid?
        expect(@motion.errors.full_messages).to include 'Plans5を入力してください'
      end
    end
  end
>>>>>>> Stashed changes
end
