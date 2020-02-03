local display={}
local mongo = require 'mongo'
local client = mongo.Client('mongodb://127.0.0.1')
local collection = client:getCollection('Database', 'Student')


function display.show()
    for person in collection:find({}):iterator() do
        print(person.name,person.lname, person.age, person.Grade)
      
      end
    return 
end

return display