class RailCar < ActiveRecord::Base
  require 'aws-sdk'
  belongs_to :purchase_order
  belongs_to :vendor

  has_attached_file :doc,
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    #:s3_credentials => "#{Rails.root}/config/aws.yml",
                    :s3_credentials => {
                      :bucket => ENV['S3_BUCKET_NAME'],
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    },
                    :s3_endpoint => "s3-us-west-1.amazonaws.com"

  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id/:filename'

  validates :railcar_nbr, presence: true, uniqueness: true
  validates_numericality_of :vendor_po_nbr, :greater_than_or_equal_to => 1000000000, :less_than_or_equal_to => 100000000000000, :message =>  "should be Halliburton TO# (10-15 digits)"
  validates_numericality_of :wgt_on_arrival, :less_than => 1000

  # Documents validations

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


  # Explicitly do not Validate
  do_not_validate_attachment_file_type :doc

  before_post_process :doc

end
