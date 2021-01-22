# Install hxp-dvorak keyboard layout

## Step 0: Change keyboard layout in GNOME

Go to `GNOME Settings -> Region & Language -> Add an Input Source -> English(United States) -> English(programmer Dvorak)`

## Step 1: Backup keymap

```bash
xmodmap -pm | tail -n 9 | grep -v '^$' | sed 's/  */ = /' | sed 's/^/clear /' | sed 's/ = [[:print:]]*//' > .Xmodmap_origin
xmodmap -pke >> .Xmodmap_origin
xmodmap -pm | tail -n 9 | grep -v '^$' | sed 's/  */ = /' | sed 's/^/add /' | sed 's/([[:alnum:]]*)//g' | sed 's/ , / /g' >> .Xmodmap_origin
```

## Step 2: Generate your own Xmodmap

```bash
xmodmap -pm | tail -n 9 | grep -v '^$' | sed 's/  */ = /' | sed 's/^/clear /' | sed 's/ = [[:print:]]*//' > .Xmodmap
```

## Step 3: Detecting keycode

```bash
xev
```

For example, when I pressed `CapsLock` , it prints

```
KeyRelease event, serial 37, synthetic NO, window 0x2200001,
    root 0x969, subw 0x0, time 1201498, (90,63), root:(140,177),
    state 0x2, keycode 66 (keysym 0xffe5, Caps_Lock), same_screen YES,
    XLookupString gives 0 bytes: 
    XFilterEvent returns: False
```

when I pressed `space`, it prints

```
KeyPress event, serial 37, synthetic NO, window 0x2200001,
    root 0x969, subw 0x0, time 1322983, (162,-19), root:(212,95),
    state 0x0, keycode 65 (keysym 0x20, space), same_screen YES,
    XLookupString gives 1 bytes: (20) " "
    XmbLookupString gives 1 bytes: (20) " "
    XFilterEvent returns: False
```

I ran

```bash
grep 'space' .Xmodmap_origin
```

It printed

```bash
keycode  65 = space NoSymbol space
```

And I wrote

```
keycode 66 = space NoSymbol space
```

To change `CapsLock` to `space`

## Step 4: Modify modifiers

```bash
tail -n8 .Xmodmap_origin  >> .Xmodmap
```

delete

```
add mod3 =
```

and apply changes by

```bash
xmodmap .Xmodmap
```

