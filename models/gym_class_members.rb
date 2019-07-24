require_relative('../db/sql_runner')

class GymClassMember
    attr_reader(:member_id, :gym_class_id, :id)


def initialize(options)
  @id = options['id'].to_i if options['id']
@member_id = options['member_id'].to_i
@gym_class_id = options['gym_class_id'].to_i
end

def save()
  sql = "INSERT INTO gym_class_members
  (
    member_id,
    gym_class_id
    )
    VALUES
    (
    $1, $2
  )
  RETURNING id"
  values = [@member_id, @gym_class_id]
  results = SqlRunner.run(sql, values)
  @id = results.first()['id'].to_i
end

def gym_class_members()
  sql = "SELECT gym_class_members.* FROM gym_class_members INNER JOIN gym_classes on gym_classes.member_id = members.id
  WHERE gym_classes.id = $1 "
  values = [@id]
  result = SqlRunner.run(sql, values)
  return result.map{|gym_class_members| GymClassMember.new(gym_class_members)}
end

def self.all()
  sql = "SELECT * FROM gym_class_members"
  results = SqlRunner.run( sql )
  return results.map { |gym_class_members| GymClassMember.new( gym_class_members ) }
end

def member()
  sql = "SELECT * FROM members
  WHERE id = $1"
  values = [@member_id]
  results = SqlRunner.run( sql, values )
  return Member.new( results.first )
end

def self.find(id)
  sql = "SELECT * FROM gym_class_members
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run(sql, values)
  return GymClassMember.new(results.first)
end

def gym_class()
  sql = "SELECT * FROM gym_classes
  WHERE id = $1"
  values = [@gym_class_id]
  results = SqlRunner.run( sql, values )
  return GymClass.new( results.first )
end

def self.delete_all()
  sql = "DELETE FROM gym_class_members"
  SqlRunner.run(sql)
end


end
