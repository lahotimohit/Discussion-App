defmodule Discussion.TopicsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `Discussion.Topics` context.
  """

  @doc """
  Generate a topic.
  """
  def topic_fixture(attrs \\ %{}) do
    {:ok, topic} =
      attrs
      |> Enum.into(%{
        title: "some title"
      })
      |> Discussion.Topics.create_topic()

    topic
  end
end
