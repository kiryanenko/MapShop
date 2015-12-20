class Hall < ActiveRecord::Base
  has_attached_file :map
  validates_attachment_content_type :map, :content_type => %w(image/jpeg image/jpg image/png)
  validates :scale, numericality: true
end
