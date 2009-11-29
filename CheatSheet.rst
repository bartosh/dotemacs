=================
Emacs Cheat Sheet
=================

Motion
------

=================== ======== =======
entity to move over backward forward
=================== ======== =======
character             C-b      C-f
word                  M-b      M-f
line                  C-p      C-n
=================== ======== =======

=================== ======== ======
entity to go        begining end
=================== ======== ======
line                C-a      C-e
sentence            M-a      M-e
paragraph           M-{      M-}
page                C-x [    C-x ]
sexp                C-M-b    C-M-f
function            C-M-a    C-M-e
buffer              M-<      M->
=================== ======== ======

- scroll to next screen C-v
- scroll to previous screen M-v
- scroll left C-x <
- scroll right C-x >
- scroll current line to center of screen C-u C-l


Files
-----
- C-x C-f read a file into Emacs
- C-x C-s save a file back to disk
- C-x s save all files
- C-x i insert contents of another file into this buffer
- C-x C-v replace this file with the file you really want
- C-x C-w write buffer to a specified file
- C-x C-q version control checkin/checkout

Getting Help
------------

The help system is simple. Type C-h (or F1) and follow the di-
rections. If you are a first-time user, type C-h t for a tutorial.

- **C-x 1:** remove help window
- *C-M-v:* scroll help window
- C-h a: apropos: show commands matching a string
- C-h c show the function a key runs
- C-h f describe a function
- C-h m get mode-specific information

Error Recovery
--------------
- C-g: abort partially typed or executing command C-g
- M-x recover-file: recover a file lost by a system crash
- C-x u or C-_: undo an unwanted change
- M-x revert-buffer: restore a buffer to its original contents
- C-l: redraw garbaged screen

Incremental Search
------------------
- C-s: search forward
- C-r: search backward
- C-M-s: regular expression search
- C-M-r: reverse regular expression search
- M-p: select previous search string
- M-n: select next later search string
- RET: exit incremental search
- DEL: undo effect of last character
- C-g: abort current search

Use C-s or C-r again to repeat the search in either direction.


