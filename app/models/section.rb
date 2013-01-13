class Section < ActiveRecord::Base
  validates_presence_of :title, :event
  
  attr_accessible :title
  
  belongs_to  :event
  has_many    :section_users
  has_many    :teachers, :through => :section_users, :source => :user, :conditions => "section_users.task = 0"
  has_many    :tas, :through => :section_users, :source => :user, :conditions => "section_users.task = 1"
  has_many    :students, :through => :section_users, :source => :user, :conditions => "section_users.task = 2"
  
  [:teacher, :ta, :student].each do |task|
    define_method "add_user_as_#{task.to_s}".to_sym do |user|
      SectionUser.create(
        :section => self,
        :user => user,
        :task => task_enum(task)
      )
    end
  end
  
  
  private
  def task_enum(key)
    {:teacher => 0, :ta => 1, :student => 2}[key]
  end
  
end