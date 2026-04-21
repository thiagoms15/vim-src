local telescope = require('telescope.builtin')

local M = {}

M.map = function(mode, shortcut, command, callback)
    vim.api.nvim_set_keymap(mode, shortcut, command, { noremap = true, silent = true , callback = callback, })
end

M.nmap = function(shortcut, command, callback)
    M.map('n', shortcut, command, callback)
end

M.imap = function(shortcut, command, callback)
    M.map('i', shortcut, command, callback)
end

M.tmap = function(shortcut, command, callback)
    M.map('t', shortcut, command, callback)
end

M.vmap = function(shortcut, command, callback)
    M.map('v', shortcut, command, callback)
end

-- define function to toggle comment for current line
M.toggle_comment = function(is_multi_line)
    is_multi_line         = is_multi_line or false
    local filetype        = vim.api.nvim_buf_get_option(0, "filetype")
    local comment_tag     = ""
    local comment_escaped = ""

    local comment_map = {
        cpp = "//",
        cmake = "#",
        conf = "#",
        lua = "--",
        rust = "//",
        python = "#",
        sh = "#"
    }
    local comment_escaped_map = {
        cpp = "//",
        cmake = "#",
        conf = "#",
        lua = "%-%-",
        rust = "//",
        python = "#",
        sh = "#"
    }
    comment_tag = comment_map[filetype] or "//"
    comment_escaped = comment_escaped_map[filetype] or "//"

    local start_line = 0
    local end_line   = 0
    local size       = 0
    if is_multi_line then
        _, start_line, cscol, _ = unpack(vim.fn.getpos('.'))
        _, end_line, cecol, _   = unpack(vim.fn.getpos('v'))
        -- swap vars if needed
        if end_line < start_line then
            start_line, end_line = end_line, start_line
        end
        start_line = start_line - 1
        -- exit visual mode
        vim.api.nvim_feedkeys(
            vim.api.nvim_replace_termcodes('<Esc>', true, false, true),
            'n',
            true
        )
    else
        end_line = vim.fn.getpos(".")[2]
        start_line = end_line - 1
    end
    size = end_line - start_line

    local line_text       = vim.api.nvim_buf_get_lines(0, start_line, end_line, false)
    local is_commented    = line_text[1]:match('^ *' .. comment_escaped) or false
    local new_buffer_line = {}

    if is_commented then
        for i=1,size do
            new_buffer_line[i] = line_text[i]:gsub(comment_escaped, '', 1)
        end
    else
        for i=1,size do
            new_buffer_line[i] = comment_tag .. line_text[i]
        end

    end
    vim.api.nvim_buf_set_lines(0, start_line, end_line, false, new_buffer_line)
end

M.open_header = function()
    local current_buffer = vim.api.nvim_get_current_buf()
    local buffer_name    = vim.api.nvim_buf_get_name(current_buffer)
    local header_file    = buffer_name:gsub('%.[^.]*$', '.h')

    header_file = header_file:gsub('.*/', '')
    local opts = {
        prompt_title = 'Header File (' .. header_file .. ')',
        prompt_prefix = ' >',
        search_file = header_file,
    }
    telescope.find_files(opts)
end

M.rg_find = function()
    local word = vim.fn.input('🔍 Search for: ')

    if not word or word == "" then
        print("No search term specified")
        return
    end

    local command = "rg --line-number --column --no-heading --color=never -e '" .. word .. "'"
    local results = vim.fn.systemlist(command)

    if #results == 0 then
        print("No results found for '" .. word .. "'")
        return
    end

    local lines = {}
    for _, result in ipairs(results) do
        local filename, line, col, match = result:match("^(.+):(%d+):(%d+):(.*)$")
        if match then -- Add a check to make sure that the message variable is not nil
            table.insert(lines, filename .. ":" .. line .. ":" .. col .. ":" .. match)
        end
    end

    if #lines ~= #results then
        print("Error to parse result for '" .. word .. "'")
        return
    end

    vim.fn.setqflist({}, "r", {lines = lines})

    vim.cmd("copen")

    print("Found " .. #results .. " results for '" .. word .. "'")
end

function dump(o)
   if type(o) == 'table' then
      local s = '{ '
      for k,v in pairs(o) do
         if type(k) ~= 'number' then k = '"'..k..'"' end
         s = s .. '['..k..'] = ' .. dump(v) .. ','
      end
      return s .. '} '
   else
      return tostring(o)
   end
end

M.cpp_check_WIP = function()
      -- Run "git status" to get a list of modified files
  local git_status = vim.fn.systemlist("git status --porcelain")
  local modified_files = {}

  -- Find all modified .h, .c, and .cpp files
  for _, line in ipairs(git_status) do
    local status, path = line:match("^%s*(%S)%S*%s+(.+)$")
    if status == "M" and (path:match("%.h$") or path:match("%.c$") or path:match("%.cpp$")) then
      table.insert(modified_files, path)
    end
  end

  if #modified_files == 0 then
    print("No modified .h, .c, or .cpp files found")
    return
  end

  -- Run cppcheck on modified files
  local command = "cppcheck --enable=all --language=c++ --suppress=missingIncludeSystem " .. table.concat(modified_files, " ")
--  print(command)

  local job_id = vim.fn.jobstart(command, {
    on_stdout = function(_, data, _)
        print("data:", dump(data))
      vim.schedule(function()
        local lines = {}
        for _, result in ipairs(data) do
            local filename, line, col, message = result:match("^(.+):(%d+):(%d+):(.+)$")
            if message then -- Add a check to make sure that the message variable is not nil
                table.insert(lines, filename .. ":" .. line .. ":" .. col .. ":" .. message)
            end
--          local file, line, col, severity, message = result:match("^(.+):(%d+):(%d+): %((%w+)%) (.+)$")
----          print("file = ", file, " line = ", line, " msg = ", message, " result = ", result)
--          if message then -- Add a check to make sure that the message variable is not nil
--            table.insert(lines, {filename = file, lnum = line, col = col, text = severity .. ": " .. message})
--          end
        end
        vim.fn.setqflist({}, "r", {lines = lines})
      end)
    end,
    on_exit = function(_, code, _)
      print("cppcheck exited with code " .. code)
      vim.cmd("copen")
--      vim.cmd("cc 1")
    end,
  })

  if job_id <= 0 then
    print("Failed to start job for cppcheck command")
    return
  end
end

M.cpp_check = function()
  -- Run "git status" to get a list of modified files
  local git_status = vim.fn.systemlist("git status -s")
--  local git_status = vim.fn.systemlist("git status --porcelain")
  local modified_files = {}

  -- Find all modified .h, .c, and .cpp files
  for _, line in ipairs(git_status) do
    local status, path = line:match("^%s*(%S)%S*%s+(.+)$")
    if status == "M" and (path:match("%.h$") or path:match("%.c$") or path:match("%.cpp$")) then
      table.insert(modified_files, path)
    end
  end

  if #modified_files == 0 then
    print("No modified .h, .c, or .cpp files found")
    return
  end

  print("Running cppcheck... ")
  local command = "cppcheck --enable=all --language=c++ --suppress=missingIncludeSystem " .. table.concat(modified_files, " ")
  local results = vim.fn.systemlist(command)

  if #results == 0 then
    print("No errors found")
    return
  end

  local lines = {}
  for _, result in ipairs(results) do
      local filename, line, col, message = result:match("^(.+):(%d+):(%d+):(.+)$")
      if message then -- Add a check to make sure that the message variable is not nil
          table.insert(lines, filename .. ":" .. line .. ":" .. col .. ":" .. message)
      end
  end

  vim.fn.setqflist({}, "r", {lines = lines})

  vim.cmd("copen")
  print("Found " .. #results .. " errors")
end

local function get_completion_from_ollama(prompt)
  local payload = vim.fn.json_encode({
        model = "llama3",
        prompt = prompt .. "\n-- continue code",
        stream = false,
        temperature = 0.2,
    })

  local cmd = "echo " .. vim.fn.shellescape(payload) .. " | curl -s http://localhost:11434/api/generate -d @-"

  print("Prompt:", prompt)
  print("Command:", cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()

  local ok, decoded = pcall(vim.fn.json_decode, result)
  if ok and decoded and decoded.response then
    return decoded.response
  else
    print("Failed to decode Ollama response")
    print("JSON decode failed!")
    print("Raw result was:", result)
    return nil
  end
end

M.CompleteWithOllama = function ()
--  local start_line = math.max(vim.fn.line('.') - 10, 1) -- get last 10 lines of context
--  local current_line = vim.fn.line('.')
--  local lines = vim.api.nvim_buf_get_lines(0, start_line - 1, current_line, false)
--  local prompt = table.concat(lines, "\n")
--
--  local response = get_completion_from_ollama(prompt)
--  if response then
--    vim.api.nvim_put({ response }, 'l', true, true)
--  end


  local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  local buf = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

  -- split prefix and suffix
  local prefix_lines = {}
  for i = 1, row do
    table.insert(prefix_lines, lines[i])
  end
  prefix_lines[#prefix_lines] = prefix_lines[#prefix_lines]:sub(1, col)

  local suffix_lines = {}
  suffix_lines[1] = lines[row]:sub(col + 1)
  for i = row + 1, #lines do
    table.insert(suffix_lines, lines[i])
  end

  local prompt = "<PRE>\n" .. table.concat(prefix_lines, "\n") ..
                 "\n<SUF>\n" .. table.concat(suffix_lines, "\n") ..
                 "\n<MID>\n"

  local payload = vim.fn.json_encode({
    model = "codellama:13b", -- or "codellama:13b-instruct" if available
    prompt = prompt,
    temperature = 0.2,
    top_p = 0.95,
    stream = false,
  })

  -- write to file to avoid shell escaping issues
  local tmpfile = "/tmp/ollama_codellama.json"
  local f = io.open(tmpfile, "w")
  f:write(payload)
  f:close()

  -- execute curl and read output
--  local cmd = "echo " .. vim.fn.shellescape(payload) .. " | curl -s http://localhost:11434/api/generate -d @-"
  local cmd = "curl -s http://localhost:11434/api/generate --data-binary @" .. tmpfile
  print("Prompt:", prompt)
  print("Command:", cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()

  local ok, decoded = pcall(vim.fn.json_decode, result)
  if not ok or not decoded or not decoded.response then
    print("Failed to decode Ollama response")
    return
  end

  -- insert generated code at cursor
  local response_lines = vim.split(decoded.response, "\n", { plain = true })
  vim.api.nvim_buf_set_lines(buf, row, row, false, response_lines)
end

return M

