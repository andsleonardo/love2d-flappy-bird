local M = {}

function M.each(t, fn)
  if #t == 0 then return end
  for i, v in ipairs(t) do fn(v, i) end
end

function M.reverseEach(t, fn)
  if #t == 0 then return end
  for i=#t, 1, -1 do fn(t[i], i) end
end

function M.map(t, fn)
  local t2 = {}
  for i, v in ipairs(t) do t2[i] = fn(v) end
  return t2
end

function M.reverseMap(t, fn)
  local t2 = {}
  for i=#t, 1, -1 do t2[i] = fn(t[i], i) end
  return t2
end

function M.filter(t, fn)
  local t2 = {}
  for _i, v in ipairs(t) do
    if fn(v) then table.insert(t2, v) end
  end
  return t2
end

function M.detect(t, fn)
  for _i, v in ipairs(t) do
    if fn(v) then return v end
  end
end

function M.dig(t, ...)
  local nestedKeys = {...}
  local key = table.remove(nestedKeys, 1)
  local value = t[key]

  if value and type(value) == "table" and #nestedKeys > 0 then
    return M.dig(value, unpack(nestedKeys))
  else
    return value
  end
end

--- Get only the keys of a table.
-- Return a new table with the given table's keys sorted alphabetically.
-- @param t The table.
function M.keys(t)
  local t2 = {}
  for k, _v in pairs(t) do table.insert(t2, k) end
  return M.sort(t2)
end

--- Get only the values of a table.
-- Return a new table with the given table's values sorted alphabetically.
-- The values in the new table can be limited with a list of keys.
-- @param t The table.
-- @param keys The optional list of keys.
function M.values(t, keys)
  local t2 = {}
  for k, v in pairs(t) do
    if not keys or M.includes(keys, k) then
      table.insert(t2, v)
    end
  end
  return M.sort(t2)
end

--- Verify if table has key.
-- Return true if a given table has a given key/index.
-- @param t The table to check.
-- @param key The key that will be searched in the table.
function M.hasKey(t, key)
  for k, _v in pairs(t) do
    if k == key then return true end
  end
  return false
end

function M.includes(t, val)
  for _i, v in ipairs(t) do
    if val == v then return true end
  end
  return false
end

--- Sort a table.
-- Return a new table with the contents of the given table
-- sorted by a sorting function or alphabetically if none is provided.
-- @param t The table to be sorted.
-- @param fn The optional sorting function.
function M.sort(t, fn)
  local fn = fn or function(a, b) return a < b end
  table.sort(t, fn)
  return t
end

return M
