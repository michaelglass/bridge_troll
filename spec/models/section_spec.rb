require 'spec_helper'

describe Section do
  let(:event) { create(:event) }
  let(:section) { create(:section, :event => event) }

  
   describe 'validation' do
     it "it has a valid factory" do
       section.should be_valid
     end
     
     context '#title' do
       it "should not be valid without a title" do
         section.title = nil
         section.should_not be_valid
       end
     end
     
     context '#event' do
       it 'should not be valid without an event' do
         section.event = nil
         section.should_not be_valid
        end
     end
   end
   
   describe 'Attendees' do
     let(:user) { create(:user) }
     
     it 'should allow adding users as teachers' do
       section.add_user_as_teacher(user)
       section.teachers.first.should eq user
     end
     it 'should allow adding users as teachers assistant' do
       section.add_user_as_ta(user)
       section.tas.first.should eq user
     end
     it 'should allow adding users as student' do
       section.add_user_as_student(user)
       section.students.first.should eq user
     end
 
   end
  
end