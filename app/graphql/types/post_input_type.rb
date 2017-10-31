Types::PostInputType = GraphQL::InputObjectType.define do
  name 'PostInputType'
  description 'Properties for creating a Post'

  argument :title, !types.String do
    description 'Title of the post.'
  end

  argument :body, types.String do
    description 'Body of the post.'
  end
end
