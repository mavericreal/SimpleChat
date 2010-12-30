class Message
  include Mongoid::Document
  field :date
  field :text
  referenced_in :user
end