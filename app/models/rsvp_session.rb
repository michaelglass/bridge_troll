class RsvpSession < ActiveRecord::Base
  belongs_to :rsvp
  belongs_to :event_session

  validates_uniqueness_of :rsvp_id, scope: :event_session_id

  after_save :update_counter_cache_for_save
  after_destroy :update_counter_cache_for_destruction

  def user_full_name
    rsvp.user.full_name
  end

  def update_counter_cache_for_destruction
    if checked_in
      Rsvp.decrement_counter :checkins_count, rsvp_id
    end
  end

  def update_counter_cache_for_save
    if checked_in_changed?
      Rsvp.update_counters rsvp_id, checkins_count: checked_in ? 1 : -1
    end
  end
end
