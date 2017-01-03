class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :has_to_be_clickbait

  def has_to_be_clickbait
    if title
      if title.downcase.include? "won't believe"
        true
      elsif title.downcase.include? "secret"
        true
      elsif title.downcase.include? "top[number]"
        true
      elsif title.downcase.include? "guess"
        true
      elsif title.downcase.include? "True"
        true
      else
        errors.add(:title, "is not clickbait")
      end
    end
  end
end


#"Won't Believe", "Secret", "Top[number]", or "Guess"
