===============================================================================
TIINT                                                              tmux for ii 
===============================================================================

A tmux  "client" for use with suckless' IRC It.

Simple script that'll make tmux windows for IRC channels with two panes:
- one for tail'ing the output
- one for getting user input

It's pretty POSIX, and'll run on both GNU and BSD systems.

It also kinda supports notifications, see CONFIG below.


----------------------------------------
USAGE
----------------------------------------
It can make a window for a single channel; windows for every channel in a
server; or windows for all channels under all servers of an irc root.

$ tiint -i $IRC_ROOT
$ tiint -s $SERVER_ROOT
$ tiint -c $CHANNEL_PATH

Personally I do:
$ tiint -i ~/chat/irc/
or
$ tiint -c ~/chat/irc/irc.freenode.net/#hase


----------------------------------------
INSTALL
----------------------------------------
Just put `tiint` and `loop_input.sh` in your path.
If you want notifications, put in `diff_monitor.sh` too.


----------------------------------------
CONFIG
----------------------------------------
There's no "config", but you can edit the script if you want. It's lightweight
and you can do whatever probably.

What you might be interested in doing is enabling notifications (uncomment
the line that calls "diff_monitor" in `tiint`), then configuring your
preferred notifcation method (zenity, beeping, whatever) by editing the
"notify" function of `diff_monitor.sh`.


----------------------------------------
BORING STUFF
----------------------------------------
License is CC-0
Author is Jaidyn Ann  <jadedctrl@posteo.at>
Sauce is at https://hak.xwx.moe/jadedctrl/tiint
