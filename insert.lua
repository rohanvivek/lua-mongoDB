local insert ={ }
local mongo = require 'mongo'
local client = mongo.Client('mongodb://127.0.0.1')
local collection = client:getCollection('Database', 'Student')

function insert.load(arg1, arg2, arg3,arg4)
    io.write("how many columns you want?\n")
    local nc = io.read()
    for i= 1,nc,1 do
        io.write("Enter the First name : \n")
        local arg1 = string.upper(io.read())
        io.write("Enter the Second name : \n")
        local arg4 = string.upper(io.read())
        io.write("Enter the age: \n")
        local arg2 = tonumber(io.read())
        io.write("Enter Student's Grade :")
        local arg3 = string.upper(io.read())
        local x = string.format( '{ "name" : %q, "lname" : %q, "age" : %d,"Grade" : %q }', arg1,arg4,arg2, arg3 )
        collection:insert(x)
        io.write("New Data Inserted!!\n")
    end
end
return insert