# frozen_string_literal: true

require '/home/pakwheels/Documents/Pakwheels/Atm_Simulator_MVC/app/views/display.rb'

def main()
  d_obj = Display.new()
  d_obj.initiate_display()
end

puts main()