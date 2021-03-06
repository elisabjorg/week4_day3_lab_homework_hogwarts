require_relative('../db/sql_runner')

class House

  attr_accessor :name
  attr_reader :id

   def initialize(options)
     @id = options['id'].to_i if options['id']
     @name = options['name']
   end

   def find_student
    sql = "SELECT * FROM students WHERE house_id = $1"
    values = [@id]
    students = SqlRunner.run(sql, values)
    return students.map {|student| Student.new(student)}
  end


   def save()
     sql = "INSERT INTO houses(name) VALUES($1) RETURNING id"
     values = [@name]
     @id = SqlRunner.run(sql, values)[0]['id'].to_i
   end

   def self.all
     sql = "SELECT * FROM houses"
     houses = SqlRunner.run(sql)
     return houses.map {|house| House.new(house)}
   end

   def self.find(id)
     sql = "SELECT * FROM houses WHERE id = $1"
     values = [@id]
     house = SqlRunner.run(sql, values)
     return House.new(house.first)
   end

   def self.delete_all
     sql = "DELETE FROM houses"
     SqlRunner.run(sql)
   end


end
