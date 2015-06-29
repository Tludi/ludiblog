class Home < ActiveRecord::Base
  scope :latest, -> {order(date: :asc, time: :asc)}

end