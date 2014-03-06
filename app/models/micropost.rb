class Micropost
  include Mongoid::Document
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :content, type: String
  field :user_id, type: Integer

  index({ user_id: 1 , created_at: 1})

  belongs_to :user

  #default_scoped order_by(:created_at => :desc)

  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }

end
