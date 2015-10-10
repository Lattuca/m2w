class Trailer < ActiveRecord::Base
  require 'aws-sdk'
  require 'm2w.rb'
  belongs_to :purchase_order


  has_attached_file :doc,
                    :storage => :s3,
                    :bucket => ENV['S3_BUCKET_NAME'],
                    :s3_credentials => {
                      :bucket => ENV['S3_BUCKET_NAME'],
                      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
                      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
                    },
                    :s3_endpoint => "s3-us-west-1.amazonaws.com"

  Paperclip::Attachment.default_options[:url] = ':s3_domain_url'
  Paperclip::Attachment.default_options[:path] = '/:class/:attachment/:id/:filename'

  validates :trailer_nbr, presence: true, uniqueness: true
  validates :driver_name, presence: true
  validates :bol_nbr, presence: true
  validates_numericality_of :bol_nbr, :greater_than_or_equal_to => 10000000, :less_than_or_equal_to => 10000000000, :message =>  "needs to be between 8-10 digits"
  validates :weight_lbs, presence: true
  validates :time_in, date:  { before_or_equal_to: :time_out }
  before_save :calculate_weight_in_tons

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

  def calculate_weight_in_tons
    self.weight_tons = cvt_lbs_to_tons(weight_lbs)
  end

end
