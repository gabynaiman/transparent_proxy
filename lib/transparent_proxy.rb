class TransparentProxy

  VERSION = '0.0.3'

  proxy_methods = [:class, :methods, :respond_to?]

  proxy_methods.each { |m| alias_method "proxy_#{m}".to_sym, m }
  
  safe_methods = [:__send__, :send, :__id__, :object_id, :tap] + proxy_methods.map { |m| "proxy_#{m}".to_sym }

  instance_methods.reject { |m| safe_methods.include? m }.
                   each   { |m| undef_method m }

  def inspect
    __getobj__.inspect
  end

  def proxy_inspect
    "#<#{proxy_class} @object=#{inspect}>"
  end

  def methods(*args)
    proxy_methods(*args) | __getobj__.methods(*args)
  end

  def respond_to?(*args)
    proxy_respond_to?(*args) || __getobj__.respond_to?(*args)
  end

  def proxy?
    true
  end

  private

  def initialize(object=nil, &block)
    @lazy_object = block_given? ? block : ->() { object }
  end

  def __getobj__
    @object ||= @lazy_object.call
  end

  def method_missing(method, *args, &block)
    __getobj__.send(method, *args, &block)
  end

end