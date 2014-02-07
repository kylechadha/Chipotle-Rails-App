require 'bcrypt'

class User
  include Mongoid::Document

  attr_accessor :password, :name

  field :name, type: String
  field :password_salt, type: String
  field :password_hash, type: String
  has_many :orders

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create
  validates_presence_of :name
  validates_uniqueness_of :name

  def authenticated?(passwd)
    # self.password_hash == BCrypt::Engine.hash_secret(passwd, self.password_salt)
    BCrypt::Password.new(self.password_hash) == passwd
  end

  before_save :encrypt_password
  
  private
    def encrypt_password
      if password.present?
        self.password_salt = BCrypt::Engine.generate_salt
        self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
        self.password = nil
      end
    end

end
