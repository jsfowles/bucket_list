require 'rails_helper'

RSpec.describe List, type: :model do
  
  describe 'List' do
  	it { should respond_to(:name) }
  	it { should respond_to(:description) }
  	it { should belong_to(:user) }
  	it { should have_many(:items) }
  end

end
