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

## dependencies

- fzf - used to implement fuzzy search
``` sh
brew install fzf
```


- Alacritty ( optional ) - used for popup window
``` sh
brew install --cask alacritty
```