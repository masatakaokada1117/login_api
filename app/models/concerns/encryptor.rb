require 'bcrypt'

module Encryptor
  def self.digest(password)
    BCrypt::Password.create(password).to_s
  end

  def self.compare(hashed_password, password)
    return false if hashed_password.blank?
    bcrypt = BCrypt::Password.new(hashed_password)
    password = BCrypt::Engine.hash_secret(password, bcrypt.salt)
    secure_compare(password, hashed_password)
  end

  def self.secure_compare(a, b)
    return false if a.blank? || b.blank? || a.bytesize != b.bytesize
    l = a.unpack "C#{a.bytesize}"

    res = 0
    b.each_byte { |byte| res |= byte ^ l.shift }
    res == 0
  end
end
