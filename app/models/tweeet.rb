class Tweeet < ApplicationRecord
belongs_to :user
has_many :likes, dependent: :destroy
validates :tweeet, presence: true,length:{:minimum=>1}
has_many :comments ,dependent: :destroy
end
