# Mark J. Lorenz's Dot Files

Run the included script to create the symlinks for each dot file.  You will be prompted to confirm each step.  A backup of existing files is made.

```bash
ls ~/ | grep '^\,'
# .dummy

./install.sh
# Link .dummy to /Users/markjlorenz/.dummy? [y/n] y

ls ~/ | grep '^\,'
# .dummy      <-- now a symlink to our dot file
# .dummy.bak  <-- the original .dummy
```
