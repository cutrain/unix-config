#!/usr/bin/env bash
python -c "import os;import shadowsocks as s;os.system('vim -c %s/cleanup/reset -c wq '+os.path.join(s.__path__[0], 'crypto/openssl.py'))"
