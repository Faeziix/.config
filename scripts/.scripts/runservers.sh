#!/bin/bash

# run dev server in background in ~/Work/Udja/udja-nextjs directory in a new alacritty window
alacritty -e sh -c "cd ~/Work/Udja/udja-nextjs && yarn dev " &

# run dev server in background in ~/Work/Udja/psightenginebackenddjango directory in a new alacritty window
alacritty -e sh -c "cd ~/Work/Udja/psightenginebackenddjango && sh ./start.sh " &

# cd into ~/Work/Udja/udja-nextjs and open nvim in new alacritty window and move the terminal to workspace 2 in dwm
alacritty -e sh -c "cd ~/Work/Udja/udja-nextjs && nvim . " &
# end
