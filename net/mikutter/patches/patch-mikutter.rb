$NetBSD: patch-mikutter.rb,v 1.9 2021/01/01 05:00:12 tsutsui Exp $

- pkgsrc can handle location of ruby binary
  https://dev.mikutter.hachune.net/issues/889

--- mikutter.rb.orig	2020-02-01 07:51:58.000000000 +0000
+++ mikutter.rb
@@ -1,7 +1,5 @@
-#!/bin/sh
+#! /usr/bin/ruby
 # -*- coding: utf-8 -*-
-exec ruby -x "$0" "$@"
-#!ruby
 =begin rdoc
 = mikutter - simple, powerful and moeful Mastodon client
 Copyright (C) 2009-2021 Toshiaki Asai
