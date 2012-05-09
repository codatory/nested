class Comment < ActiveRecord::Base
  belongs_to :post

  before_save :cb_before_save

  def cb_before_save
    puts "Before Save: #{self.attributes.inspect}"
    self.title = self.title.titleize unless self.title.blank?
  end
end
