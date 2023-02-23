require 'rails_helper'

RSpec.describe ActivityCategory, type: :model do
  before :each do
    @user = User.create(first_name: 'Recilah',last_name: 'Khamala', email: 'recillah@gmail.com', password: '123456', password_confirmation: '123456')
    @category = Category.create(name: 'Books', icon: 'books.png', user_id: @user.id)
    @activity = Activity.create(name: 'tranz', amount: 20.7, user_id: @user.id)
    @activity_category = ActivityCategory.new(category_id: @category.id, activity_id: @activity.id)
  end

  context 'Validations:' do
    it 'fails with nil category ' do
      @activity_category.category = nil
      @activity_category.save
      expect(@activity_category).to_not be_valid
    end

    it 'fails with nil transaction' do
      @activity_category.activity= nil
      @activity_category.save
      expect(@activity_category).to_not be_valid
    end
  end
end
