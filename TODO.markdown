Tasks to get Portable Hole Functional
=====================================

1. <strike>Add a `Rakefile` to make running the tests consistently easy.</strike>
2. Refactor our early authentication work into a cleaner approach.  I think we
   want to move all details of a request into a `PortableHole::Request` object,
   so we can build up the details of the message to be sent and have a place to
   hang functionality like signing.  Let's also reduce that code as much as
   possible by extracting non-changing elements, like OpenSSL's SHA1 digest
   identifier, and items that likely just need to be set once for the entire
   session, like the AWS Access ID and Secret Key.
3. Get the rest of the [authentication examples on this page](http://docs.amazonwebservices.com/AmazonS3/latest/dev/index.html?RESTAuthentication.html) passing.
