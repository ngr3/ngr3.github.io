--[[

  kerr hub  

  UPDATES AND FIXES
  
  1.0.0 CREATES A REPOSITORY

]]


---------url load function

local function urlLoad(url)
    local success, result = pcall(game.HttpGet, game, url);

    if (not success) then
        return fail(string.format('Failed to GET url %q for reason: %q', url, tostring(result)))
    end;

    local fn, err = loadstring(result);

    if (type(fn) ~= 'function') then
        return fail(string.format('Failed to loadstring url %q for reason: %q', url, tostring(err)))
    end;

    local results = { pcall(fn) };
    if (not results[1]) then
        return fail(string.format('Failed to initialize url %q for reason: %q', url, tostring(results[2])))
    end;

    return unpack(results, 2);
end

---------script:
-------im need a programing
