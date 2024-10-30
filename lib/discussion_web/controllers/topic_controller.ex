defmodule DiscussionWeb.TopicController do
  use DiscussionWeb, :controller
  alias Discussion.Repo

  def home(conn, _params) do
    topics = Repo.all(Discussion.Topics.Topic)
    render(conn, :home, topics: topics)
  end

  def new(conn, _params) do
    struct = %Discussion.Topics.Topic{}
    params = %{}
    changeset = Discussion.Topics.Topic.changeset(struct, params)
    render(conn, :new, changeset: changeset)
  end

  def create(conn, params) do
    %{"topic" => topic} = params
    changeset = Discussion.Topics.Topic.changeset(%Discussion.Topics.Topic{}, topic)
    case Repo.insert(changeset) do
      {:ok, post} ->
        conn
        |> put_flash(:info, "Topic Created Successfully")
        |> redirect(to: ~p"/")
      {:error, changeset} -> render(conn, :new, changeset: changeset)
    end
  end

end
