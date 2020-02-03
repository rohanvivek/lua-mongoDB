local findall={}
local mongo = require 'mongo'
local client = mongo.Client('mongodb://127.0.0.1')
local collection = client:getCollection('Database', 'Student')


function findall.see(arg1)
  
    for person in collection:find({}):iterator() do
        if (person.name == arg1) then
          print(person.name,person.lname, person.age, person.Grade)
        end
        
      end
    return 
end

return findall