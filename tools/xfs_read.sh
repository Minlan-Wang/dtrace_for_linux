#!/bin/bash

../dtrace -n 'fbt::xfs_readdir:entry { printf("%s", execname); }'
