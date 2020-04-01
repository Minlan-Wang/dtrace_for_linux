#!/bin/bash

../dtrace -n 'fbt::ext3_permission:entry { printf("%s", execname); }'
