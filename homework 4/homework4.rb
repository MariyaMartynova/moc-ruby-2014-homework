
require 'json'
RESPONSE=
    '{"person": {"personal_data": {"name": "Mariya Martynova", "age": 24, "birthday": 1990, "e-mail": "yashkina1502@gmail.com"},
    "social_profiles": ["http: //facebook.com/mariykamartynova"],
    "additional_info": {"hobby": ["travelling", "singing", "snowboarding", "cooking"]},
    "pets": {"name": "Hachiko", "species": "CanisIupusfamiliaris"}}}'

response = JSON.parse(RESPONSE)
Person = Struct.new(*response["person"].keys.collect(&:to_sym)) do

 def have_hobbies?(additional_info)
  !additional_info["hobby"].empty?
 end
end

person = Person.new(*response["person"].values)
person.instance_eval do

 def facebook_account?
  result = false
  social_profiles.each do |social_profile|
   if !social_profile.downcase.scan(/facebook/).empty?
    result = true
   end
  end
  result
 end
end

p "facebook_account?"
p person.facebook_account?
p "have_hobbies?"
p person.have_hobbies?(person.additional_info)