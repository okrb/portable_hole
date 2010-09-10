require 'openssl'
require 'base64'

class PortableHole
  def initialize(access_key, secret_key)
    @access_key = access_key
    @secret_key = secret_key
  end
  def string_to_sign(date, request_type, resource)
    request_type + "\n" +
    # content_md5 +
    "\n" +
    # content_type +
    "\n" +
    date + "\n" +
    # canonicalized_amz_headers +
    resource
  end
  def sign(date, request_type, resource)
    raw_hmac = OpenSSL::HMAC.digest(OpenSSL::Digest::Digest.new('sha1'), @secret_key, string_to_sign(date, request_type, resource))
    sig = Base64.encode64(raw_hmac).chomp

    "Authorization: AWS %s:%s" % [@access_key, sig]
  end
end