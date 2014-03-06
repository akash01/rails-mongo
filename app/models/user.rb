class User
  include Mongoid::Document
  include ActiveModel::SecurePassword
  include Mongoid::Timestamps::Created
  include Mongoid::Timestamps::Updated

  field :firstname, type: String
  field :lastname, type: String
  field :password_digest, type: String
  field :email, type: String 
  field :admin, type: Boolean, default: false
  
  index({ email: 1 }, { unique: true })

  has_many :microposts, dependent: :destroy
  
  before_save { self.email = email.downcase }
  has_secure_password


  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  
  validates :email, presence: true, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, length: { minimum: 6 }

end
