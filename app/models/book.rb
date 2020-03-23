class Book < ApplicationRecord
    validates  :title,:comment,:price,{presence:true}
    validates  :price, numericality: { only_integer: true }
end
