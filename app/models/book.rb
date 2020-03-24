class Book < ApplicationRecord
    validates  :title,:comment,:price,{presence:true}
    validates  :price, numericality: { only_integer: true }

#本の詳細画面でユーザー情報を表示するためのメソッド
    def user
      return User.find_by(id: self.user_id)
    end
end
