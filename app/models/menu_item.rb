class MenuItem < ActiveRecord::Base
  belongs_to :menu
 def to_pleasant_string
  "#{id} #{menu_id} #{name} #{description} #{price}"
 end

end
