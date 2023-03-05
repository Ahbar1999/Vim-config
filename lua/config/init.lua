-- nvim config main file 
-- lets fucking learn lua and fuck around with vim no ?
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}

border = string.rep("*", 10)
empty_line = string.rep(" ", 10)
--print("\n\n")
print(border)
print("Loaded lua.init")
-- print("Dont' forget to add me")
print(border)
print(empty_line)
--print("\n\n")




