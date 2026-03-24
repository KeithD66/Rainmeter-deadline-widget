function Initialize()
    deadline = SELF:GetOption('Deadline')
end

local function parseDate(s)
    local y, m, d, hh, mm, ss = s:match("(%d+)%-(%d+)%-(%d+) (%d+):(%d+):(%d+)")
    return os.time({
        year = tonumber(y),
        month = tonumber(m),
        day = tonumber(d),
        hour = tonumber(hh),
        min = tonumber(mm),
        sec = tonumber(ss)
    })
end

function Update()
    local now = os.time()
    local target = parseDate(deadline)
    local diff = target - now

    if diff <= 0 then
        return "0d 00h 00m 00s"
    end

    local days = math.floor(diff / 86400)
    diff = diff % 86400
    local hours = math.floor(diff / 3600)
    diff = diff % 3600
    local mins = math.floor(diff / 60)
    local secs = diff % 60

    return string.format("%02dD %02dH %02dM %02dS", days, hours, mins, secs)
end