class EventSubscription < ActiveRecord::Base
 belongs_to :user

 validates :email_id, uniqueness: true
end
