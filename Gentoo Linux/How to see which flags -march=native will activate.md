# [How to see which flags -march=native will activate?](https://stackoverflow.com/questions/5470257/how-to-see-which-flags-march-native-will-activate)

If you want to find out how to set-up a non-native cross compile, I found this useful:

On the target machine,

```c
% gcc -march=native -Q --help=target | grep march
-march=                               core-avx-i
```

Then use this on the build machine:

```c
% gcc -march=core-avx-i ...
```

