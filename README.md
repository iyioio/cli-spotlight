# cli-spotlight
A simple cli based Spotlight search replacement


<br/><br/>

## Examples

This example will search for apps to open Applications and Utilities and search for folders to open
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

## dependencies

- fzf - used to implement fuzzy search
``` sh
brew install fzf
```


- Alacritty ( optional ) - used for popup window
``` sh
brew install --cask alacritty
```