class Group < ApplicationRecord
  has_many :group_members
  belongs_to :user#後で消すTODO
end
