local delete ={}
local mongo = require 'mongo'
local client = mongo.Client('mongodb://127.0.0.1')
local collection = client:getCollection('Database', 'Student')

function delete.remove(arg1)
    
    local y = string.format('{ "name" : %q}', arg1)
    local person = collection:findOne(y):value()
    if (person.name ~= nil) then
        
        collection:remove(y)
        io.write("Data Removed \n", arg1,"\n")
    else
        io.write("Not Found!!")
    return person.name
    end
end




return delete

