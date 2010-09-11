Portable Hole
=============

This is a group project by [OK.rb](http://ok-ruby.org/) to:

1. Build a better wrapper for S3 (supporting all features in a nice interface)
2. Learn more about good library development practices
3. Try out pet ideas for working with S3

Why the name Portable Hole?
---------------------------

We meant the ACME cartoon thing you can use to create a hole anywhere.  This seems similar to S3 storage, where you just shove some data in a magic hole and pull it back out later.  We didn't mean anything dirty by the name.

In other words, [this](http://www.flickr.com/photos/23879054@N00/2691101530/).  Not [this](http://www.lulu.com/product/hardcover/bride-of-portable-hole-the-book-of-neurotic-fantasy/816560).

The Basics
----------

We want Portable Hole to cover all the features of S3 in an easy-to-use interface.  Most of the existing libraries either don't cover some features, or make you switch interfaces just to use certain features, or are just needlessly complex.

We're aiming for something along the lines of:

  okrb = PortableHole.bucket("okrb")
  
  okrb.object("PortableHole").put("DATA")
  # ... or ...
  okrb.object("PortableHole").stream("path/to/file")

Alternately, we may just use one method and stream content from `IO` objects while we upload `String` content in one big chunk.

Of course the methods will take various options to set metadata header, access various S3 features like logging or versions, and allow the user to manage access control.  We also want to support chunked downloads with an offset and size.

Getting Fancy
-------------

Our group has various pet ideas we want to try out with Portable Hole.  For example, my pet idea is to support various HTTP strategies.  I want to do this so I can use a system like [Typhoeus](http://github.com/pauldix/typhoeus) to improve download speeds (by downloading multiple chunks in parallel).
