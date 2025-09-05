local M = {}

local socket = require("socket")

function M.grab_banner(tcp, port)
    tcp:settimeout(1)
    if port == 80 or port == 8080 then
        tcp:send("GET / HTTP/1.0\r\n\r\n")
    elseif port == 25 then
        tcp:send("HELO example.com\r\n")
    elseif port == 21 then
        tcp:send("USER anonymous\r\n")
    end
    local data = tcp:receive(64) -- read up to 64 bytes
    return data
end

return M
