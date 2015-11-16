class Room < ActiveRecord::Base
    belongs_to :building
    has_many :reservations
    has_many :subjects
end
