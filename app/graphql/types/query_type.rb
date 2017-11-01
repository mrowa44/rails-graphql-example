Types::QueryType = GraphQL::ObjectType.define do
  name "Query"
  # Add root-level fields here.
  # They will be entry points for queries on your schema.

  field :post do
    type Types::PostType
    argument :id, !types.ID
    description 'Find a Post by ID'
    resolve ->(_obj, args, _ctx) { Post.find(args['id']) }
  end

  field :posts do
    type types[Types::PostType]
    argument :limit, types.Int
    description 'List all posts'
    resolve ->(_obj, args, _ctx) { Post.first(args[:limit] || 100) }
  end
end
