def class_from_resource_name(resource_name)
  klass = Object::const_get(resource_name.capitalize)
end

def factory_from_resource_name(resource_name)
  Object::const_get("#{resource_name.capitalize}Factory")
end
