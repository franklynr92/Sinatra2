class User < ActiveRecord::Base
    has_many :orders
    has_many :baskets, through: :orders
end
