class Order
  include Mongoid::Document
  field :type, type: String
  field :meat, type: Array, default: []
  field :cheese, type: Mongoid::Boolean

  belongs_to :user
end
