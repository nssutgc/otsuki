class User < ApplicationRecord
  validates :name,{presence:true}
  validates :nickname,{presence:true}
  validates :age,{presence:true}
  validates :position,{presence:true}
  validates :family,{presence:true}
  validates :team,{presence:true}
end
