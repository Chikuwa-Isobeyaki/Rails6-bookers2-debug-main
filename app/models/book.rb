class Book < ApplicationRecord
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  
  has_many :book_comments, dependent: :destroy
  
  has_many :view_counts, dependent: :destroy
  
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}
  
  
  def favorited_by?(user)
     favorites.exists?(user_id: user.id)
  end
  
   # 検索機能関係
  def self.search_for(content, search)
    if search == 'perfect'
      Book.where(title: content)
    elsif search == 'forward'
      Book.where('title LIKE ?', content + '%')
    elsif search == 'backward'
      Book.where('title LIKE ?', '%' + content)
    else
      Book.where('title LIKE ?', '%' + content + '%')
    end
  end
end
