
require 'json'

RESPONSE=
    '{
    "person": {
        "personal_data": {
            "name": "Mariya Martynova",
            "age": 24,
            "genger": "female",
            "e-mail": "yashkina1502@gmail.com",
            "country": "Ukraine"
        },
        "social_profiles": [
            "http: //facebook.com/mariykamartynova",
            "http: //vk.com/mariya.martynova",
            "http: //fit4brain.com/"
        ],
        "additional_info": {
            "hobby": [
                "travelling",
                "singing",
                "snowboarding",
                "cooking"
            ]
        },
        "pets": {
            "name": "Hachiko",
            "species": "CanisIupusfamiliaris"
        }
    }
}'

module PersonalData

  module ClassMethods

    def magic_methods(*magic_words)

      define_method magic_words[0] do
        p "Real magic word #{}"
      end
      define_method magic_words[1] do
        p "Real magic word1 #{}"
      end
      define_method magic_words[2] do
        p "Real magic word2 #{}"
      end
      define_method magic_words[3] do
        p "name: #{self.personal_data['name']}"
        p "age: #{self.personal_data['age']}"
        p "genger: #{self.personal_data['genger']}"
        p "e-mail:#{self.personal_data['e-mail']}"
        p "country:#{self.personal_data['country']}"
        p "social_profiles:#{self.social_profiles.join ',' }"
        p "pets:#{self.pets['name']}"
        p "hobby:#{self.additional_info['hobby']}"
      end

    end

  end

  def self.included(base)
    base.extend(ClassMethods)
  end
end

json_array= JSON.parse(RESPONSE)

puts json_array

if json_array.key?("person")

  p json_array["person"].keys

  person_object = Struct.new("Person", *json_array["person"].keys.collect(&:to_sym))
  Struct::Person.class_eval do
    include PersonalData
    magic_methods :adult?, :have_hobbies?, :have_pets?, :parameters?
  end

  person=person_object.new(*json_array["person"].values)

  p person.inspect

  person.adult?
  person.have_hobbies?
  person.have_pets?
  person.parameters?

end

# try add block and and handle code

class Users

    def self.create_user(name, profession, &block)
      ->(own_block) do
        p "My mame is #{name}!"
        yield
        own_block.call
      end
      attr_accessor :users
      def initialize(user_info)
        self.users= []
        users_info.each do |hash|
          if hash.has_key?('name'){p "What is your name?"}

      end
    end
      end
    end

  end
