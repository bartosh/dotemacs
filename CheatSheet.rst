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

Killing and Deleting
--------------------
============== ========= =======
entity to kill backward  forward
============== ========= =======
character      DEL       C-d
word           M-DEL     M-d
line           M-0 C-k   C-k
sentence       C-x DEL   M-k
sexp           M-- C-M-k C-M-k
============== ========= =======

- kill region: C-w     
- copy region to kill ring: M-w
- kill through next occurrence of char: M-z char
- yank back last thing killed: C-y
- replace last yank with previous kill: M-y

Marking
-------

- set mark here: C-@ or C-SPC
- exchange point and mark: C-x C-x
- set mark arg words away: M-@
- mark paragraph: M-h
- mark page: C-x C-p
- mark sexp: C-M-@
- mark function: C-M-h
- mark entire buffer: C-x h

Query & Replace
---------------
- interactively replace a text string: M-%
- using regular expressions: M-x query-replace-regexp

Valid responses in query-replace mode are:

- replace this one, go on to next: SPC
- replace this one, don?t move: ,
- skip to next without replacing: DEL
- replace all remaining matches: !
- back up to the previous match: ^
- exit query-replace: RET
- enter recursive edit (C-M-c to exit): C-r


Buffers
-------
- select another buffer: C-x b
- list all buffers: C-x C-b
- kill a buffer: C-x k

Tags
----
- find a tag (a definition): M-.
- find next occurrence of tag: C-u M-.
- specify a new tags file: M-x visit-tags-table
- regexp search on all files in tags table: M-x tags-search
- run query-replace on all the files: M-x tags-query-replace
- continue last tags search or query-replace: M-,

Shells
------
- execute a shell command: M-!
- run a shell command on the region: M-|
- filter region through a shell command: C-u M-|
- start a shell in window *shell*: M-x shell

Abbrevs
-------
- add global abbrev: C-x a g
- add mode-local abbrev: C-x a l
- add global expansion for this abbrev: C-x a i g
- add mode-local expansion for this abbrev: C-x a i l
- explicitly expand abbrev: C-x a e
- expand previous word dynamically: M-

Keyboard Macros
---------------
- start defining a keyboard macro: C-x (
- end keyboard macro definition: C-x )
- execute last-defined keyboard macro: C-x e
- append to last keyboard macro: C-u C-x (
- name last keyboard macro: M-x name-last-kbd-macro
- insert Lisp definition in buffer: M-x insert-kbd-macro

Multiple Windows
----------------

When two commands are shown, the second is for ?other frame.?

- delete all other windows: C-x 1
- split window, above and below: C-x 2    C-x 5 2
- delete this window: C-x 0   C-x 5 0
- split window, side by side: C-x 3
- scroll other window: C-M-v
- switch cursor to another window: C-x o    C-x 5 o
- select buffer in other window: C-x 4 b    C-x 5 b
- display buffer in other window C-x 4 C-o  C-x 5 C-o
- find file in other window: C-x 4 f   C-x 5 f
- find file read-only in other window: C-x 4 r   C-x 5 r
- run Dired in other window: C-x 4 d   C-x 5 d
- find tag in other window: C-x 4 .    C-x 5 .
- grow window taller: C-x ^
- shrink window narrower: C-x {
- grow window wider: C-x }

Formatting
----------
- indent current line (mode-dependent): TAB
- indent region (mode-dependent): C-M-\
- indent sexp (mode-dependent): C-M-q
- indent region rigidly arg columns: C-x TAB
- insert newline after point: C-o
- move rest of line vertically down: C-M-o
- delete blank lines around point: C-x C-o
- join line with previous (with arg, next): M-^
- delete all white space around point: M-\
- put exactly one space at point: M-SPC
- fill paragraph: M-q
- set fill column: C-x f
- set prefix each line starts with: C-x .
- set face: M-g

Case Change
-----------
- uppercase word: M-u
- lowercase word: M-l
- capitalize word: M-c
- uppercase region: C-x C-u
- lowercase region: C-x C-l

The Minibuffer
--------------
- complete as much as possible: TAB
- complete up to one word: SPC
- complete and execute: RET
- show possible completions: ?
- fetch previous minibuffer input: M-p
- fetch later minibuffer input or default: M-n
- regexp search backward through history: M-r
- regexp search forward through history: M-s
- abort command: C-g

Type C-x ESC ESC to edit and repeat the last command that
used the minibuffer. Type F10 to activate the menu bar using
the minibuffer.

Getting Help
------------

The help system is simple. Type C-h (or F1) and follow the di-
rections. If you are a first-time user, type C-h t for a tutorial.

- remove help window: C-x 1
- scroll help window: C-M-v
- apropos. show commands matching a string: C-h a
- show the function a key runs: C-h c
- describe a function: C-h f
- get mode-specific information: C-h m

Error Recovery
--------------
- abort partially typed or executing command: C-g
- recover a file lost by a system crash: M-x recover-file
- undo an unwanted change: C-x u or C-_
- restore a buffer to its original contents: M-x revert-buffer
- redraw garbaged screen: C-l

Incremental Search
------------------
- search forward: C-s
- search backward: C-r
- regular expression search: C-M-s
- reverse regular expression search: C-M-r
- select previous search string: M-p
- select next later search string: M-n
- exit incremental search: RET
- undo effect of last character: DEL
- abort current search: C-g

Use C-s or C-r again to repeat the search in either direction.

