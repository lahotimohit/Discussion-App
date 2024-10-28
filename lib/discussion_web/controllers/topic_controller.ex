defmodule DiscussionWeb.TopicController do
  use DiscussionWeb, :controller

  def new(conn, _params) do
    struct = %Discussion.Topics.Topic{}
    params = %{}
    changeset = Discussion.Topics.Topic.changeset(struct, params)
    render(conn, :new, changeset: changeset)
  end

end
