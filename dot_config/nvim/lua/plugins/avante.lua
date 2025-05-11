local status, avante = pcall(require, "avante")
if (not status) then return end

avante.setup({
  auto_suggestions = false,
  provider = "copilot",
  behaviour = {
    enable_cursor_planning_mode = true,
  },
  copilot = {
    model = "claude-3.7-sonnet",
    timeout = 180000,
    max_completion_tokens = 131072,
    disable_tools = true
  },
  ollama = {
    -- model = "codellama:latest"
    -- model = "deepseek-coder-v2"
    model = "codellama:7b-code",
    options = {
      num_ctx = 32768,
      temperature = 0,
    },
    endpoint = "http://127.0.0.1:11434",
    stream = true,
    disable_tools = true
  },
})
