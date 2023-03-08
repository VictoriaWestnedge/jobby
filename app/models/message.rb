class Message < ApplicationRecord
  belongs_to :employer, class_name: 'User'
  belongs_to :employee, class_name: 'User'
  belongs_to :chatroom
end
