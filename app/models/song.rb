class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: true
    validates :released, presence: true 
    #Custom validation -- validates :release_year, presence: true
    #Custom validation -- validates :release_year this needs to be a specific date range
    validates :artist_name, presence: true
    validates :genre, presence: true 
end
