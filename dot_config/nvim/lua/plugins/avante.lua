local status, avante = pcall(require, "avante")
if (not status) then return end

avante.setup({
  auto_suggestions = false,
  provider = "copilot",
  behaviour = {
    enable_cursor_planning_mode = true,
  },
  providers = {
    copilot = {
      model = "claude-sonnet-4",
      timeout = 60000, -- 60 seconds
      extra_request_body = {
        {
          max_completion_tokens = 60000,
        },
      }
    },
    ollama = {
      -- model = "codellama:latest"
      -- model = "deepseek-coder-v2"
      model = "gemma3:12b-it-qat",
      extra_request_body = {
        options = {
          num_ctx = 32768,
          temperature = 0,
        },
      },
      endpoint = "http://127.0.0.1:11434",
      stream = true,
      disable_tools = true
    },
  },
  -- system_prompt as function ensures LLM always has latest MCP server state
  -- This is evaluated for every message, even in existing chats
  system_prompt = function()
    local hub = require("mcphub").get_hub_instance()
    return hub and hub:get_active_servers_prompt() or ""
  end,
  -- Using function prevents requiring mcphub before it's loaded
  custom_tools = function()
    return {
      require("mcphub.extensions.avante").mcp_tool(),
    }
  end,
})
