require_relative('../db/sql_runner')

class Member
  attr_reader(:first_name, :last_name, :id)

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def pretty_name()
  return "#{@first_name} #{@last_name}"
end

def save()
  sql = "INSERT INTO members
  (
    first_name,
    last_name
  )
  VALUES
  (
    $1, $2
  )
  RETURNING id"
  values = [@first_name, @last_name]
  results = SqlRunner.run(sql, values)
    @id = results.first()['id'].to_i
  end

  def gym_classes()
    sql = "SELECT gym_classes.* FROM gym_classes INNER JOIN gym_class_members on gym_class_members.gym_class_id = gym_classes.id
    WHERE members.id = $1 "
    values = [@id]
    result = SqlRunner.run(sql, values)
    return result.map{|gym_class| GymClass.new(gym_class)}
  end

  def self.all
    sql = "SELECT * FROM members"
    return SqlRunner.run(sql).map {|member| Member.new(member)}
  end

  def self.find( id )
  sql = "SELECT * FROM members
  WHERE id = $1"
  values = [id]
  results = SqlRunner.run( sql, values )
  return Member.new( results.first )
end



  def self.delete_all()
    sql = "DELETE FROM members"
    SqlRunner.run( sql )
  end

  def self.destroy(id)
    sql = "DELETE FROM members
    WHERE id = $1"
    values = [id]
    SqlRunner.run(sql, values)
  end



end
