# frozen_string_literal: true

require '/home/pakwheels/Documents/Pakwheels/Atm_Simulator_MVC/app/controllers/admin_controller.rb'
require '/home/pakwheels/Documents/Pakwheels/Atm_Simulator_MVC/app/controllers/user_controller.rb'

class Display
  def initialize
    @ac_obj = AdminController.new()
    @uc_obj = UserController.new()
  end

  def admin_display

    print("Please enter your admin pin : ")
    admin_pin = gets.chomp().to_i

    if @ac_obj.verify_admin_controller(admin_pin) == true

      print('Hello ', @ac_obj.find_data_controller(admin_pin)['name'])
      print("\n You can do the following : \n" )
      print("1. Add new Admin to the Database \n")
      print("2. View all admin details \n")

      print("\n Please enter your choice : ")
      choice = gets.chomp().to_i

      if choice == 1
        print("\n Please enter admin name : ")
        na_name = gets.chomp()
        print("\n Please enter admin ID : ")
        na_id = gets.chomp()
        print("\n Please enter admin pin : ")
        na_pin = gets.chomp().to_i

        @ac_obj.admin_add_controller(na_name, na_id, na_pin)

      elsif choice == 2
        print("\n Data of all admins are given : ")
        for data in @ac_obj.get_data_controller
          print("\n Admin Name : ", data['name'])
          print("\n Admin ID : ", data['id'])
          print("\n Admin Pin : ", data['pin'])
        end
      else
        print("Not Found \n\n")
        print("Please 'Y' to continue : ")
        choice = gets.chomp()
        if choice.to_s == 'Y'
          main_display
        else
          print("Thank you .")
        end
      end
    else
      print("Not Found \n\n")
      print("Please 'Y' to continue : ")
      choice = gets.chomp()
      if choice.to_s == 'Y'
        main_display
      else
        print("Thank you .")
      end
    end

  end

  def user_display

    print("Please enter your user pin : ")
    user_pin = gets.chomp().to_i

    if @uc_obj.verify_user_controller(user_pin) == true

      print('Hello ', @uc_obj.find_data_controller(user_pin)['name'])
      print("\n You can do the following : \n" )
      print("1. Withdraw Amount \n")
      print("2. View Balance \n")

      print("\n Please enter your choice : ")
      choice = gets.chomp().to_i

      if choice == 1
        print("Please enter the amount you want to withdraw : ")
        amount = gets.chomp().to_i
        @uc_obj.withdraw_controller(amount, user_pin)
        print("Withdraw Completed.")

      elsif choice == 2
        print("Your account details are : \n")
        data = @uc_obj.find_data_controller(user_pin)
        print("\n Name : ", data['name'])
        print("\n ID : ", data['id'])
        print("\n Balance : ", data['balance'])
      end

    end


  end

  def main_display

    print("\t\t------------------- ATM Simulator System ------------------ \n\n")
    print("\t\t 1. Login as Banker \n")
    print("\t\t 2. Login as Customer \n")

    print("Please enter your choice : ")
    choice = gets.chomp().to_i

    if choice == 1
      admin_display
    elsif choice == 2
      user_display
    end
  end

  def initiate_display
    return main_display
  end

end
