require_relative('../db/sql_runner')

class GymClass

  attr_reader(:class_name, :price, :member_id, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @class_name = options['class_name']
    @price = options['price'].to_i
  end

def name()
  return @class_name
end

def save()
  sql = "INSERT INTO gym_classes
  (
    class_name,
    price
    )
    VALUES
    (
    $1, $2
  )
  RETURNING id"
  values = [@class_name, @price]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def update()
  sql = "UPDATE gym_classes
  SET
  (
    class_name,
    price
    )
    =(
      $1, $2
      )
      WHERE id = $3"
      values = [@class_name, @price, @id]
      SqlRunner.run(sql, values)
    end

def members()
  sql = "SELECT members.* FROM members
  INNER JOIN gym_class_members on gym_class_members.member_id = members.id
  WHERE gym_class_members.gym_class_id = $1 "
  values = [@id]
  result = SqlRunner.run(sql, values)
  return result.map{|member| Member.new(member)}
end

def self.all
  sql = "SELECT * FROM gym_classes"
  return SqlRunner.run(sql).map {|gym_class| GymClass.new(gym_class)}
end

def self.find( id )
sql = "SELECT * FROM gym_classes
WHERE id = $1"
values = [id]
results = SqlRunner.run( sql, values )
return GymClass.new( results.first )
end

def self.delete_all()
  sql = "DELETE FROM gym_classes"
  SqlRunner.run( sql )
end

def self.destroy(id)
  sql = "DELETE FROM gym_classes
  WHERE id = $1"
  values = [id]
  SqlRunner.run(sql, values)
end


end
