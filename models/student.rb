require_relative('../db/sql_runner')


class Student


  attr_accessor :first_name, :second_name, :house_id, :age
  attr_reader :id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @second_name = options['second_name']
    @house_id = options['house_id']
    @age = options['age']
  end

  def find_house
    sql = "SELECT * FROM houses WHERE houses.id = $1"
    values = [@house_id]
    houses = SqlRunner.run(sql, values)
    return houses.map {|house| House.new(house)}
  end

  def find_house_name
    sql = "SELECT name FROM houses WHERE id = $1"
    values = [@house_id]
    houses = SqlRunner.run(sql, values).first
    return houses['name']
  end

  def full_name()
    return "#{@first_name} #{@second_name}"
  end

  def save()
    sql = "INSERT INTO students(first_name, second_name, house_id, age) VALUES($1, $2, $3, $4) RETURNING id"
    values = [@first_name, @second_name, @house_id, @age]
    @id = SqlRunner.run(sql, values)[0]['id'].to_i
  end

  def Student.all
    sql = "SELECT * FROM students"
    students = SqlRunner.run(sql)
    return students.map {|student| Student.new(student)}
  end

  def self.find(id)
    sql = "SELECT * FROM students WHERE id = $1"
    values = [@id]
    student = SqlRunner.run(sql, values)
    return Student.new(student.first)
  end

  def self.delete_all
    sql = "DELETE FROM students"
    SqlRunner.run(sql)
  end




end
