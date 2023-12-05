# Swagger::Blocks

original source:
https://github.com/fotinakis/swagger-blocks

## Utils

This is a fork of the original gem, with some additional features:

To concatenate multiple swagger files, you can use the `Swagger::Utils::concatenate` method.

```ruby
# v1/schemas/profiles
module Swagger
  module V1

    module Schemas
      module Profile
        include Swagger::Blocks
        include Swagger::Utils

        concatenated do # this will be concatenated to the main schema in order of appearance
          swagger_schema :Profile do
            key :required, [:id, :email, :phone, :first_name, :last_name]
            property :id do
          #...

# v1/base.rb your root file
require_relative 'schemas/profiles'
require 'swagger/blocks'

module Swagger
  module V1
    class Base
      include Swagger::Blocks
      include Swagger::Utils

      swagger_root do
        key :swagger, '2.0'

        info do
          key :version, '1.0.0'
        #...
      end # swagger_root
        
      concat Schemas::Profile # this will be concatenated to the main schema in order of appearance
    end # Base
  end # V1
end # Swagger
```
