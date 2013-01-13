class SectionUser < ActiveRecord::Base
  
  belongs_to  :user
  belongs_to  :section
  
  validates_presence_of :task, :user, :section
  
end