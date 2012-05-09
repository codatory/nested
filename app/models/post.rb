class Post < ActiveRecord::Base
  has_many :comments
  accepts_nested_attributes_for :comments, :allow_destroy => true, :reject_if => Proc.new { |attr| attr['title'].blank? }

  after_initialize { comments.new unless comments.last.title.blank? }
end
