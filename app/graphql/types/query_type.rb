Types::QueryType = GraphQL::ObjectType.define do
  name "Query"

  field :post do
    type Types::PostType
    argument :id, !types.ID
    description 'Find a Post by ID'
    resolve ->(_obj, args, _ctx) { Post.find(args['id']) }
  end

  field :posts do
    type types[Types::PostType]
    description 'Get posts'

    argument :offset, types.Int, default_value: 0
    argument :count, types.Int, default_value: 5
    argument :order, types.String, default_value: 'desc'
    argument :orderBy, types.String, as: :order_by, default_value: 'created_at'

    resolve ->(_obj, args, _ctx) do
      Post
        .order(args[:order_by] => args[:order])
        .offset(args[:offset])
        .first(args[:count])
    end
  end
end
