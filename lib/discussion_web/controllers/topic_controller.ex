defmodule DiscussionWeb.TopicController do
  use DiscussionWeb, :controller

  def new(conn, _params) do
    render(conn, :new)
  end

end
