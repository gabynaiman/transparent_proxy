class TransparentProxy

  VERSION = '0.0.2'

  proxy_methods = [:class, :methods, :respond_to?]

  proxy_methods.each { |m| alias_method "proxy_#{m}".to_sym, m }
  
  safe_methods = [:__send__, :send, :__id__, :object_id, :tap] + proxy_methods.map { |m| "proxy_#{m}".to_sym }

  instance_methods.reject { |m| safe_methods.include? m }.
                   each   { |m| undef_method m }

  def inspect
    __target__.inspect
  end

  def proxy_inspect
    "#<#{proxy_class} @object=#{inspect}>"
  end

  def methods(*args)
    proxy_methods(*args) | __target__.methods(*args)
  end

  def respond_to?(*args)
    proxy_respond_to?(*args) || __target__.respond_to?(*args)
  end

  def proxy?
    true
  end

  private

  def initialize(object=nil, &block)
    @target = object
    @target_block = block
  end

  def __target__
    @target ||= @target_block.call
  end

  def method_missing(method, *args, &block)
    __target__.send(method, *args, &block)
  end

end