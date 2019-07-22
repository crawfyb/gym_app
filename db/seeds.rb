require_relative( "../models/members.rb" )
require_relative( "../models/gym_classes.rb" )
require("pry-byebug")

GymClass.delete_all()
Member.delete_all()


member1 = Member.new({
  "first_name" => "John",
  "last_name" => "Harper"
  })

  member1.save


member2 = Member.new({
  "first_name" => "Jarrod",
  "last_name" => "Bennie"
  })

  member2.save

member3 = Member.new({
  "first_name" => "Juan",
  "last_name" => "Mata"
  })

  member3.save

member4 = Member.new({
  "first_name" => "Zsolt",
  "last_name" => "Podjfaf-sasdifas"
  })

  member4.save

  gym_class1 =GymClass.new({
    "class_name" => "Spin",
    "price" => 12,
    "member_id" => member2.id
    })

    gym_class1.save

binding.pry
nil
