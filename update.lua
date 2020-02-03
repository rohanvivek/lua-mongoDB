local update ={}
local mongo = require 'mongo'
local client = mongo.Client('mongodb://127.0.0.1')
local collection = client:getCollection('Database', 'Student')

function update.change(upd,arg1,arg2,arg3,arg4)
    
    local y = string.format('{ "name" : %q}', upd)
    local person = collection:findOne(y):value()
    if (person.name ~= nil) then
        io.write("Enter the New First name : \n")
        local arg1 = string.upper(io.read())
        io.write("Enter the Second name : \n")
        local arg4 = string.upper(io.read())
        io.write("Enter the age: \n")
        local arg2 = tonumber(io.read())
        io.write("Enter Student's Grade :")
        local arg3 = string.upper(io.read())
        local x = string.format( '{ "name" : %q, "lname" : %q, "age" : %d,"Grade" : %q }', arg1,arg4,arg2, arg3 )
        collection:update({name =upd}, x)
        io.write("Data Updated!!\n")
    else
        io.write("Not Found!!")
    return person.name
    end
end




return update


