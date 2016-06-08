require 'rails_helper'

RSpec.describe Item, type: :model do

	describe 'attributes' do
		it { should respond_to :title }
		it { should respond_to :complete_by }
		it { should respond_to :completed }
		it { should respond_to :completed_date}
		it { should belong_to(:list) }
		it { should validate_presence_of(:title) }
	end

	describe 'callbacks' do

		before(:each) do
			@item = Item.create(title: 'for test', completed: false)
			@item.update(completed: true)
		end

		it { is_expected.to callback(:set_completed_date).before(:update) }

		it 'updates completed_date' do
			expect(@item.completed_date).to eq(Date.today)
		end

	end

end
