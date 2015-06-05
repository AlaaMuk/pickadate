class Appointment < ActiveRecord::Base
# before_save :convert_to_datetime

# #     def date
# #     self.test_date.strftime("%Y-%m-%d")
# #     end

# #     def time
# #     self.test_time.strftime("%I:%M %p")
# #     end

# #     def convert_to_datetime
# #       self.appointment = DateTime.parse("#{@date} #{@time}")
# #     end

#     def convert_to_datetime
#         puts self.test_appointment.strftime("%m %e, %Y at %I:%M")
#     end
end