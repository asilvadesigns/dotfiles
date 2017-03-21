### Solved
Some hours and googling later, I realized this has nothing to do with alacritty but nevertheless, it's working and this is my result.
![screen shot 2017-03-21 at 8 56 34 am](https://cloud.githubusercontent.com/assets/7071307/24148273/78189fce-0e14-11e7-936c-3337e35e4f68.png)

### Solution
#### Part 1 - the simple stuff
1. First off you'll need to purchase Operator Mono, Hoefler & Co customer support told me Operator Mono SSm is the way to go for sizes 9px to 18px.
2. Set it as the font within *alacritty.yml* - (reference above screenshot).
3. If you use NerdFonts, you'll need to patch Operator Mono using FontForge [here](https://github.com/ryanoasis/nerd-fonts#font-patcher).
4. Within *vimrc or init.vim*
   ```
   hi Comment gui=italic cterm=italic
   hi htmlArg gui=italic cterm=italic
   ```
#### Part 2 - the hard stuff
1. In home directory create new file `xterm-256color-italic.terminfo` with the following contents:
   ```
   xterm-256color-italic|xterm with 256 colors and italic,
   sitm=\E[3m, ritm=\E[23m,
   use=xterm-256color,
   ```
2. Compile it, with command: `tic xterm-256color-italic.terminfo`
3. Set it as the TERM within *alacritty.yml* - (reference above screenshot).
4. Restart *alacritty*. test with command: `echo -e "\e[3mfoo\e[23m"`. It should output *foo* in italics.

#### Part 3 - tmux
1. Place the following within your *tmux.conf*:
   ```
   # enable true color support and italics
   set -g default-terminal "xterm-256color-italic"
   set -ga terminal-overrides ",xterm-256color-italic:Tc"
   ```
2. Restart *tmux*

#### Invaluable Resources
* https://github.com/tmux/tmux/issues/377
* https://github.com/nicknisi/dotfiles/search?utf8=%E2%9C%93&q=italic&type=Code
* https://github.com/nicknisi/dotfiles/blob/fa2254d2468f12ffb6df4b18b555dc0c9549de79/resources/tmux-256color-italic.terminfo
* https://github.com/tmux/tmux/issues/435
* https://github.com/ryanoasis/nerd-fonts#font-patcher
