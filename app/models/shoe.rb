class Shoe < ApplicationRecord
    belongs_to :brand
    accepts_nested_attributes_for :brand #brand_attributes=

    def brand_attributes=(hash_of_attributes)
        # byebug
        if !hash_of_attributes["name"].blank? && !hash_of_attributes["year_founded"].blank?
            self.brand = Brand.find_or_create_by(hash_of_attributes)
        end
    end

    validates :condition, presence: true
    validates :price, numericality: {greater_than: 0, less_than: 5000}
    validates :color, presence: true, two_word: true, uniqueness: {scope: [:brand, :price]}
    # validate :too_many_shoes

    def name_and_color 
        "#{self.brand.name} - #{self.color}"
    end

    def self.order_by_price 
        self.order(price: :desc).limit(1)
    end

    # def self.most_expensive 
    #     self.where("LIMIT 1")
    # end

    def too_many_shoes 
        if Shoe.all.length >= 6
            errors.add(:base, :invalid, message: "you have too many Shoes!")
        end
    end
end
