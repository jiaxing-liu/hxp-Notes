# Generate Hash for Linux shadow file

use openssl

```bash
openssl passwd -6 -salt some_random_string hxp
```

 or use random salt

```bash
openssl passwd -6 hxp
```

