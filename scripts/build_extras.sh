nvim --headless --clean -c "lua package.path = package.path .. ';./lua/?.lua;./lua/?/init.lua'" -c "lua require('borealis').build_extras()" -c "qa"
