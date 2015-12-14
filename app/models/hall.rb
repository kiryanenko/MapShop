class Hall < ActiveRecord::Base
  # validates_attachment :map, content_type: { content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"] }
  has_attached_file :map
  validates_attachment_content_type :map, :content_type => %w(image/jpeg image/jpg image/png)
end
