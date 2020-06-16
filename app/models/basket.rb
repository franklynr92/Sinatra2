class Basket < ActiveRecord::Base
    belongs_to :user
    #has_many :orders
    #has_many :users, through: :orders
    validates :name, :ingredients, presence: true
end
