# Using wget to clone a whole site

One liner:

```bash
wget --recursive --no-clobber --span-hosts --page-requisites --html-extension --convert-links --restrict-file-names=windows --domains ys168.com --no-parent http://qzbltushu.ys168.com/
```

Explained:

```bash
wget \
     --recursive \ # Download the whole site.
     --page-requisites \ # Get all assets/elements (CSS/JS/images).
     --adjust-extension \ # Save files with .html on the end.
     --span-hosts \ # Include necessary assets from offsite as well.
     --convert-links \ # Update links to still work in the static version.
     --restrict-file-names=windows \ # Modify filenames to work in Windows as well.
     --domains yoursite.com \ # Do not follow links outside this domain.
     --no-parent \ # Don't follow links outside the directory you pass in.
         yoursite.com/whatever/path # The URL to download
```

Inspired by <https://gist.github.com/mikecrittenden/fe02c59fed1aeebd0a9697cf7e9f5c0c>