#!/usr/bin/env bash

when-changed -v -r -1 -s ./    "hexo g && hexo s" 

