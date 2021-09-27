local HTTPS = game:GetService('HttpService')
local BL = {'exe', 'scr', 'bat', 'com', 'csh', 'msi', 'vb', 'vbs', 'vbe', 'ws', 'wsf', 'wsh', 'ps1', 'psy'} -- No-no file extensions
local function hasformat(str)
    if not (type(str) == 'string' and str:match('%.')) then
        return false
    end
    local split = str:split('.')
    local ext = split[#split]
    return (ext:match('[%a%d]+') == ext and table.find(BL, ext) == nil)
end

local function validate(val, t)
    if type(val) ~= t then
        error(('invalid argument #1 (%s expected, got nil)'):format(t), 2)
    end
end
local file = {}
file.__index = file
function file.new(path, ct)
    if path and ct and hasformat(path) and type(ct) == 'string' then
        writefile(path, ct)
    end
    return setmetatable({
        _path = path,
    }, file)
end
function file.open(path)
    if path and hasformat(path) then
        return setmetatable({
            _path = path,
        }, file)
    end
end
function file:read()
    if hasformat(self._path) and isfile(self._path) then
        return readfile(self._path)
    end
end
function file:has(str)
    if hasformat(self._path) and isfile(self._path) and str and type(str) == 'string' then
        local FileData = readfile(self._path)
        return string.match(FileData, str)
    end
end
function file:append(ct)
    if self._path and ct and hasformat(self._path) and isfile(self._path) and type(ct) == 'string' then
        appendfile(self._path, ct)
    end
end
function file:write(ct)
    if self._path and ct and hasformat(self._path) and isfile(self._path) and type(ct) == 'string' then
        writefile(self._path, ct)
    end
end
function file:readJSON()
    if self._path and hasformat(self._path) and isfile(self._path) then
        local Decoded = HTTPS:JSONDecode(readfile(self._path))
        validate(Decoded, 'table')
        return Decoded
    end
end
function file:writeJSON(tbl)
    validate(tbl, 'table')
    if self._path and hasformat(self._path) and isfile(self._path) and tbl and type(tbl) == 'table' then
        writefile(self._path, HTTPS:JSONEncode(tbl))
    end
end
function file:appendJSON()
    validate(tbl, 'table')
    if hasformat(self._path) and isfile(self._path) and tbl and type(tbl) == 'table' then
        appendfile(self._path, HTTPS:JSONEncode(tbl))
    end
end
function file:del()
    if hasformat(self._path) and isfile(self._path) then
        delfile(self._path)
    end
end
function file:delete()
    if hasformat(self._path) and isfile(self._path) then
        delfile(self._path)
    end
end
return file
