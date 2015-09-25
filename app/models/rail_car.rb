class RailCar < ActiveRecord::Base
  belongs_to :purchaseorder
  belongs_to :vendor
  #Document attachments
  has_attached_file :doc, :url => "/:class/:attachment/:id/:basename.:extension",
                          :path => ":rails_root/public/:class/:attachment/:id/:basename.:extension"
  


  validates :railcar_nbr, presence: true, uniqueness: true
  validates_numericality_of :vendor_po_nbr, :greater_than_or_equal_to => 1000000000, :less_than_or_equal_to => 100000000000000, :message =>  "should be Halliburton TO# (10-15 digits)"
  validates_numericality_of :wgt_on_arrival, :less_than => 1000

  # Documents validations
  #validates_attachment :doc, content_type: {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document)}
  #validates_attachment :doc, content_type: {:content_type => %w(image/jpeg image/jpg image/png application/pdf application/msword application/vnd.openxmlformats-officedoc.wordprocessingml.doc)}
  #validates_attachment :doc, content_type: {content_type: "application/pdf"}
  validates_attachment :doc,
       content_type: {content_type: ['text/plain',
                                      "image/jpeg",
                                      "image/jpg",
                                      "image/png",
                                      "application/pdf",
                                      "application/vnd.ms-excel",
                                      "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet",
                                      "application/msword",
                                      "application/vnd.openxmlformats-officedocument.wordprocessingml.document"]},
                       size: {less_than: 2.megabytes}
  # Validates Size
  #validates_with AttachmentSizeValidator, attributes: :doc, less_than: 1.megabytes
  # Explicitly do not Validate
  do_not_validate_attachment_file_type :doc

  before_post_process :doc

end
