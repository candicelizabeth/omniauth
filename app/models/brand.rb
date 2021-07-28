class Brand < ApplicationRecord
    has_many :shoes 
    accepts_nested_attributes_for :shoes, reject_if: proc { |attributes| attributes['color'].blank? || attributes['price'].blank? || attributes['condition'].blank?}

    validates :name, presence: true, length: {minimum: 2, message: "should be longer than 2"}
end
