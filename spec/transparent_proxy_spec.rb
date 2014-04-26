require 'minitest_helper'

describe TransparentProxy do

  it 'Transparent' do
    proxy = TransparentProxy.new 1

    proxy.must_equal 1
    (proxy + 1).must_equal 2
    proxy.class.must_equal Fixnum
    proxy.inspect.must_equal 1.inspect
    proxy.methods.must_equal proxy.proxy_methods | 1.methods
    proxy.respond_to?(:+).must_equal true
  end
  
  it 'Proxy methods' do
    proxy = TransparentProxy.new 1

    proxy.proxy?.must_equal true
    proxy.proxy_class.must_equal TransparentProxy
    proxy.proxy_inspect.must_match /#<TransparentProxy @object=1>/
    proxy.proxy_methods.must_include_all [:__send__, :__id__, :object_id, :tap]
    proxy.proxy_respond_to?(:object_id).must_equal true
    proxy.proxy_respond_to?(:+).must_equal false
  end

  it 'Subclass' do
    class NumberProxy < TransparentProxy
      def to_letters
        'one'
      end
    end

    proxy = NumberProxy.new 1
    proxy.to_letters.must_equal 'one' 
  end

end