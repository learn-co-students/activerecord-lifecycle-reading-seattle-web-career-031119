class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case

  before_validation :make_title_case
  ## use before validation when you are changing a model attribute, like changing the case or format

  # before_save :email_author_about_post
  ## use before save when you are doing something that doesn't change a model attribute - like sending an email

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

  def make_title_case
    self.title = self.title.titlecase
  end
end
