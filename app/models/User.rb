class User
  include Mongoid::Document
  field :name
  field :password
  field :imgurl
  references_many :message
  
  # Overwrite the save method
  def save
    if userExists(self.name)
      return false
    else
      super
    end
  end
  
  # Encrypt the current password of the user
  def encryptPassword
    require 'sha1'
    self.password = SHA1.new(self.password).to_s
  end
  
  # Check if the name and password match with a user in the database
  def authenticate(name,password)
    require 'sha1'
    password = SHA1.new(password).to_s
    res = false
    if name == self.name and password == self.password
      res = true
    end
    return res
  end
  
end

  
def getUserByName(name)
  return User.where(:name => name).first
end

def userExists(name)
  return getUserByName(self.name) != nil
end





