#!/usr/bin/env ruby -w

require "test/unit"
require "portable_hole"

class TestPortableHole < Test::Unit::TestCase
  def setup
    @access_key = "0PN5J17HBGZHT7JJ3X82"
    @secret_key = "uV3F3YluFJax1cknvbcGwgjvx4QpvB+leU8dUj2o"
    @date = 'Tue, 27 Mar 2007 19:36:42 +0000'
    @request_type = 'GET'
    @canonical_resource = '/johnsmith/photos/puppy.jpg'
  
    @ph = PortableHole.new(@access_key, @secret_key)
  end
  
  def test_auth_header_string_to_sign
    expected =<<STRING.chomp
GET


Tue, 27 Mar 2007 19:36:42 +0000
/johnsmith/photos/puppy.jpg
STRING
    
    
    actual = @ph.string_to_sign(@date, @request_type, @canonical_resource)
    
    assert_equal expected, actual
  end
  
  def test_auth_header
    expected = "Authorization: AWS 0PN5J17HBGZHT7JJ3X82:xXjDGYUmKxnwqr5KXNPGldn5LbA="

    actual = @ph.sign(@date, @request_type, @canonical_resource)
    
    assert_equal expected, actual
  end
  
  # someday/maybe features
  # test_lowercase_request_type
  # test_get
end