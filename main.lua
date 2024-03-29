
local math_floor = math.floor

function convertBytes (bytes)
    if (not bytes) then return error ('Error in argument #1. Set the number of bytes') end
    local bytes = bytes
    local kbytes, mbytes, gbytes = math_floor (bytes / 1000), math_floor (bytes / 1000000), math_floor (bytes / 1000000000)
    return ((bytes > 0 and bytes < 1000 and bytes.. ' B') or ((kbytes > 0 and kbytes < 1000) and kbytes.. ' KB') or ((mbytes > 0 and mbytes < 1000) and mbytes.. ' MB') or ((gbytes > 0 and gbytes < 1000) and gbytes.. ' GB'))
end

function getFileSize (path)
    local file = fileOpen (path, true)
    local bytes = 0
    if (file) then
       bytes = fileGetSize (file)
    end
    fileClose (file)
    return bytes
end
