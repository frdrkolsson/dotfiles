local status, java = pcall(require, "java")
if (not status) then return end

java.setup()
