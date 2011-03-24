module ClassExtension
   if !Class.respond_to?("hash_initializer")
     def hash_initializer(*attribute_names)
       define_method(:initialize) do |*args|
         data = args.first || {}
         data.symbolize_keys!
         attribute_names.each do |attribute_name|
           instance_variable_set "@#{attribute_name}", data[attribute_name]
           self.class.send :attr_accessor, :"#{attribute_name}"
         end
      end
    end
  end
end

Class.send :include, ClassExtension
