require_relative('models/student.rb')
require_relative('models/house.rb')
require('pry-byebug')

House.delete_all()
Student.delete_all()

house_1 = House.new({
  'name' => 'Gryffindor'
  })
  house_2 = House.new({
    'name' => 'Ravenclaw'
    })

    house_1.save
    house_2.save


student_1 = Student.new({
  'first_name' => 'Kira',
  'second_name' => 'Qureshi',
  'house_id' => house_2.id,
  'age' => 23
  })
student_2 = Student.new({
  'first_name' => 'Elisa',
  'second_name' => 'Bjorg',
  'house_id' => house_1.id,
  'age' => 30
  })
student_1.save()
student_2.save()

binding.pry
nil
