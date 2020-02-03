local find={}
local mongo = require 'mongo'
local client = mongo.Client('mongodb://127.0.0.1')
local collection = client:getCollection('Database', 'Student')
function find.search(arg1)
    
    local y = string.format('{ "name" : %q}', arg1)
    local person = collection:find(y):value()
    io.write("Yes your data is there.. ")
    
    return person.name, person.age
end
return find