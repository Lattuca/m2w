class Worker < ActiveRecord::Base
  has_many :trailers

  validates :badge_nbr, presence: true, uniqueness: true
  validates :first_name,
            :last_name,
            :effective_date,
            :address_line_1,
            :city_name,
            :state_code,
            :zip_code,
            :email, presence: true

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.list_for_select_worker
     self.all.map do |worker|
        [worker.full_name, worker.badge_nbr]
     end
  end
end
