#!/bin/bash

# APC
install_apc() {
  APC_VERSION='3.1.13'
  echo "Installing APC PECL extension..." >&3
  ${DESTINATION_DIR}/php5/bin/pecl install apc-${APC_VERSION} & progress

  echo 'extension = apc.so
apc.enabled = 1
apc.shm_size = 128M
apc.shm_segments=1
apc.write_lock = 1
apc.rfc1867 = On
apc.ttl=7200
apc.user_ttl=7200
apc.num_files_hint=1024
apc.mmap_file_mask=/tmp/apc.XXXXXX
apc.enable_cli=1
; Optional, for "[apc-warning] Potential cache slam averted for key... errors"
; apc.slam_defense = Off
' > /etc/php5/conf.d/apc.ini
  
}

