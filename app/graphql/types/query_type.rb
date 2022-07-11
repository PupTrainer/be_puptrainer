module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    field :fetch_user, resolver: Queries::FetchUser
    field :fetch_skills, resolver: Queries::FetchSkills
  end
end
