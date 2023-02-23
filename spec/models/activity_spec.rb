require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'activity model' do
    before(:each) do
      @user = User.create(first_name: 'Recilah',last_name: 'Khamala', email: 'recillah@gmail.com', password: '123456', password_confirmation: '123456')
      @category = Category.new(name: 'Books', icon: 'books.png')
    end

    it 'does not accept an invalid name' do
      expense = Activity.create name: '', amount: 13, user_id: @user.id
      expect(expense).to_not be_valid
    end

    it 'does not accept an invalid amount' do
      expense = Activity.create name: 'Harry Porter', amount: '', user_id: @user.id
      expect(expense).to_not be_valid
    end

    it 'does not accept an invalid user_id' do
      expense = Activity.create name: 'Harry Porter', amount: 13, user_id: nil
      expect(expense).to_not be_valid
    end

    it 'does not accept an invalid name, amount and user_id' do
      expense = Activity.create name: '', amount: '', user_id: nil
      expect(expense).to_not be_valid
    end
  end
end
