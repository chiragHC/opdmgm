class Appointment < ActiveRecord::Base

  scope :for_date, -> (date) { where(appointment_time: date.beginning_of_day..date.end_of_day) }
end
