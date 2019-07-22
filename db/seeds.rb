require_relative( "../models/members.rb" )
require_relative( "../models/gym_classes.rb" )
require_relative( "../models/gym_class_members.rb" )
require("pry-byebug")

GymClass.delete_all()
GymClassMember.delete_all()
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
    "price" => 12
    })

      gym_class1.save

  gym_class2 =GymClass.new({
    "class_name" => "Body Pump",
    "price" => 15
    })

      gym_class2.save

  gym_class3 =GymClass.new({
    "class_name" => "Zumba",
    "price" => 10
    })

      gym_class3.save

      gym_class_members1 = GymClassMember.new({
        "member_id" => member1.id,
        "gym_class_id" => gym_class3.id
        })

        gym_class_members1.save()

      gym_class_members2 = GymClassMember.new({
        "member_id" => member2.id,
        "gym_class_id" => gym_class3.id
        })

        gym_class_members2.save()

      gym_class_members3 = GymClassMember.new({
        "member_id" => member4.id,
        "gym_class_id" => gym_class3.id
        })

        gym_class_members3.save()

      gym_class_members4 = GymClassMember.new({
        "member_id" => member1.id,
        "gym_class_id" => gym_class2.id
        })

        gym_class_members4.save()

      gym_class_members5 = GymClassMember.new({
        "member_id" => member2.id,
        "gym_class_id" => gym_class2.id
        })

        gym_class_members5.save()

      gym_class_members6 = GymClassMember.new({
        "member_id" => member3.id,
        "gym_class_id" => gym_class1.id
        })

        gym_class_members6.save()



binding.pry
nil
