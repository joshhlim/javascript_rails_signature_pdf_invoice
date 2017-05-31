class Invoice < ActiveRecord::Base
  belongs_to :user
  validates :store_name, :user_id, presence: true
end
