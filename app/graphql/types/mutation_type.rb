Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  # TODO: Remove me
  field :testField, types.String do
    description "An example field added by the generator"
    resolve ->(obj, args, ctx) {
      "Hello World!"
    }
  end

  field :addPost, Types::PostType do
    description 'Adds a Post.'

    argument :post, Types::PostInputType
    resolve ->(_t, args, _ctx) {
      Post.create!(args[:post].to_h)
    }
  end
end
