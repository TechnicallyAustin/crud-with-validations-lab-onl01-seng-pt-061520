class Song < ApplicationRecord
    validates :title, presence: true 
    validates :title, uniqueness: true
    validates :released, presence: true 
    validates :release_year, presence: true,
        if: :released?
    validate :duplicate_title
    validate :future_date
    validates :artist_name, presence: true
    validates :genre, presence: true

    def duplicate_title
        # dont allow duplicate titles
        if Song.any? { |t| t.title == title && t.artist_name == artist_name && t.release_year == release_year}
            errors.add(:title, "Can't add the same song twice.")
        end

    end

    def future_date
        #dont allow a date that is in the future 
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "release year can't be in the future")
        end

    end




end
