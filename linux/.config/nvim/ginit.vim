" Hack to change GUI Font on start up

" NO
" DejaVu letters look more clear than Fira Code.
" execute "GuiFont! DejaVu Sans Mono:h11"
" execute "GuiFont! DejaVuSansMono NF:h10"
" execute "GuiFont! Fira Code Retina:h9"

" BAD Fonts
" Telescope looks like crap with JetBrains font.
" execute "GuiFont! JetBrains Mono:h10"

" NERD Fonts

" Too wide at a round font size
" InputMono = Nerd Font version of Input Mono
execute "GuiFont! InputMono NF:h10.5"
" GuiLinespace 0

" #1
" execute "GuiFont! Iosevka Term SS09:h11"
" execute "GuiFont! Iosevka NF:h11"
" execute "GuiFont! RiddlesevkaTerm NF:h11"
" execute "GuiFont! IosevkaMine NF:h10"
" GuiLinespace 4
" GuiLinespace -1

" #2
" The 1 looks like crap at 10.5, but I like the spacing. I would use Iosevka but
" since it's a custom font, I cannot get a patched font for it.
" execute "GuiFont! SauceCodePro Nerd Font Mono:h12"
" GuiLinespace 0

" #3
" execute "GuiFont! Hack Nerd Font Mono:h11"
" GuiLinespace 0

" #4
" Telescope corners look like shit.
" execute "GuiFont! mononoki Nerd Font Mono:h11"
" GuiLinespace 0

" #5
" Cascadia | pipes do not touch, Telescope corners look like shit.
" execute "GuiFont! CaskaydiaCove Nerd Font:h10.5"
" GuiLinespace 0


" GuiLinespace 0
" GuiLinespace -2
GuiPopupmenu 0
GuiTabline 0
