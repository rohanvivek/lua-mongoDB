local mongo = require 'mongo'
local client = mongo.Client('mongodb://127.0.0.1')

local collection = client:getCollection('lua-mongo-test', 'test')
--collection:drop()  --Clear collection
io.write("how many columns you want?\n")
local nc = io.read()
for i= 1,nc,1 do
  io.write("Enter the name and age: \n")

  local nme = io.read()
  io.write("Enter the age: \n")
  local ag = tonumber(io.read())
  local x = string.format( '{ "name" : %q, "age" : %d, "class" : 2 }', nme, ag )
  print(x)
  collection:insert(x)
end
--iterate document in for loop
for person in collection:find({}):iterator() do
  print(person.name, person.age)

end
io.write("\n this is for loop \n")
--to find single document
--local query =
local person = collection:findOne(mongo.BSON('{ "age" : { "$gt" : 12 } }')):value()
print(person.name, person.age)

io.write("find and modify what?")
local arg1 = io.read()
local y = string.format('{ "name" : %q}', arg1)
local z = string.format('{ "name" : "Shyam"}')
local person = collection:findAndModify({name ="Rohan"}, {name ="Vishnu"})
print(person)

local bulk = collection:createBulkOperation()
bulk:removeOne{name = "Rohan"}

--bulk:execute()
local cursor = collection:find{name = "Rohan"}
local person = collection:find('name' == "Rohan"):value()
print(cursor)
print(person)