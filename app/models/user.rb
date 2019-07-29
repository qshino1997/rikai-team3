class User < ApplicationRecord
  has_many :borrow
  has_many :histories
  has_many :feedbacks
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    VALID_MASV_REGEX = /\A[0-9]/i
    validates :hoten, presence: { message: " không được để  trống" }, length: { maximum: 20 }
    validates :lop, presence: { message: " không được để  trống" }, length: { maximum: 20 }
    validates :email, presence: { message: " không được để  trống" }, length: { maximum: 50 },
    format: {with: VALID_EMAIL_REGEX, message: " không đúng định dạng"}, uniqueness: { case_sensitive: false ,message: " này đã tồn tại"  }
    validates :masv, presence: { message: " không được để  trống" } , length: { maximum: 50 },
    format: {with:VALID_MASV_REGEX , message: "Vui lòng nhập số" }, uniqueness: { case_sensitive: false ,message: " này đã tồn tại"  }
    has_secure_password 
    validates :password ,presence: { message: " không được để  trống" }, length: { minimum: 6, message: " không được dưới 6 ký tự" }, allow_nil: true

    class << self
      # Returns the hash digest of the given string.
      def digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
      end     

      def new_token
        SecureRandom.urlsafe_base64
      end

    end

    def User.digest(string)
        cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                      BCrypt::Engine.cost
        BCrypt::Password.create(string, cost: cost)
    end

    def User.new_token
      SecureRandom.urlsafe_base64
    end

    def remember
      self.remember_token = User.new_token
      update_attribute(:remember_digest, User.digest(remember_token))
    end

    def authenticated?(remember_token)
      return false if remember_digest.nil?
      BCrypt::Password.new(remember_digest).is_password?(remember_token)
    end

    def forget
      update_attribute(:remember_digest, nil)
    end

end
