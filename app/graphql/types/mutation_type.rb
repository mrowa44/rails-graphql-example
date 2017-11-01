Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :addPost, Types::PostType do
    description 'Adds a Post.'

    argument :post, Types::PostInputType
    resolve ->(_t, args, _ctx) {
      Post.create!(args[:post].to_h)
    }
  end
end
