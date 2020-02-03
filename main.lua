local mongo = require 'mongo'
local input = require 'insert'
local discover = require 'find'
local modify = require'update'
local erase = require 'delete'
local put = require 'display'
local look = require'findall'
local client = mongo.Client('mongodb://127.0.0.1')
local collection = client:getCollection('Database', 'Student')
--collection:drop()


while (1) do
io.write("choose any operation\n1.Insert\n2.Find\n3.Update\n4.Delete\n5.Display\n6.Find All\n7.Exit\n")
local switch = tonumber(io.read())
if (switch==1) then
    print(input.load())
elseif (switch == 2) then
    io.write("What name you want to search?\n")
    local srch = string.upper(tostring(io.read()))
    print(discover.search(srch))
elseif (switch == 7) then
    break
elseif(switch==3) then --update
    io.write("Enter the first name to update data\n")
    local upd = string.upper(tostring(io.read()))
    print(modify.change(upd))
    io.write("New Data Updated!!\n")
elseif (switch==4) then --delete
    io.write("Enter the Data you want to delete :\n")
    local data = string.upper(io.read())
    print(erase.remove(data))
    
elseif (switch==5) then --display
    print(put.show())

elseif (switch==6) then --findall
    io.write("Enter the Data to find")
    local watch = string.upper(io.read())
    print(look.see(watch))
end
end