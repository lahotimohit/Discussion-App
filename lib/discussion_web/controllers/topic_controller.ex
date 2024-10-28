defmodule DiscussionWeb.TopicController do
  use DiscussionWeb, :controller
  alias Discussion.Repo

  def new(conn, _params) do
    struct = %Discussion.Topics.Topic{}
    params = %{}
    changeset = Discussion.Topics.Topic.changeset(struct, params)
    render(conn, :new, changeset: changeset)
  end

  def create(conn, params) do
    IO.inspect(params)
    %{"topic" => topic} = params
    changeset = Discussion.Topics.Topic.changeset(%Discussion.Topics.Topic{}, topic)
    case Repo.insert(changeset) do
      {:ok, post} -> IO.inspect(post)
      {:error, changeset} -> render(conn, :new, changeset: changeset)
    end
  end

end
