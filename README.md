# cli-spotlight
A simple cli based Spotlight search replacement


<br/><br/>

## Examples

This example searches for apps to open in Applications and Utilities and folders to open
with vscode
``` sh
./cli-spotlight.sh \
    '/Applications/*.app' \
    '/System/Applications/*.app' \
    '/Applications/Utilities/*.app' \
    '/System/Applications/Utilities/*.app' \
    'code:~/projects/*'
```

This example is the same as the above example except a popup window is opened to search in
``` sh
./popup-cli-spotlight.sh \
    '/Applications/*.app' \
    '/System/Applications/*.app' \
    '/Applications/Utilities/*.app' \
    '/System/Applications/Utilities/*.app' \
    'code:~/projects/*'
```


<br/><br/>

## Custom open commands
By default cli-spotlight opens selected path using the open command. You can use a custom command
by prefixing search paths with the name of the command you would like to open results with.

``` sh

## Open with VSCode
./cli-spotlight.sh 'code:~/projects/*'

## Open with TextMate
./cli-spotlight.sh 'mate:~/projects/*'
```


<br/><br/>

## Shell commands
Shell commands can be ran using the shell prefix.

The example assumes ~/scripts is a directory containing shell scripts. When a result is selected
the result will be executed as a script instead of being opened as a file.
``` sh
./cli-spotlight.sh 'shell:~/scripts/*.sh'
```


<br/><br/>

## Replace MacOS Spotlight Search ( cmd+space )
Using skhd and the key mapping below us can replace the built in Spotlight search with the 
cli-spotlight popup.

``` txt
# skhd (cmd+space) key mapping

cmd - space : [path to cli-spotlight folder]/popup-cli-spotlight.sh \
                    '/Applications/*.app' \
                    '/System/Applications/*.app' \
                    '/Applications/Utilities/*.app' \
                    '/System/Applications/Utilities/*.app' \
                    'code:~/docs/*'
```

I also recommend disabling spotlight indexing
``` sh
sudo mdutil -i off
```

skhd - https://github.com/koekeishiya/skhd

<br/><br/>

## dependencies

- fzf - used to implement fuzzy search
``` sh
brew install fzf
```


- Alacritty ( optional ) - used for popup window
``` sh
brew install --cask alacritty
```