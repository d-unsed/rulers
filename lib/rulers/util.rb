module Rulers
  # Translate CamelCased constant name to snake_case
  def self.to_underscore(str)
    str
      .gsub('::', '/')
      .gsub(/(([A-Z])(?=[A-Z][a-z])|([a-z\d])(?=[A-Z]))/, '\1_')
      .tr('-', '_')
      .downcase
  end
end
