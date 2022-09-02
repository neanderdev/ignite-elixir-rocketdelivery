defmodule RocketdeliveryWeb.ItemsView do
  use RocketdeliveryWeb, :view

  alias Rocketdelivery.Item

  def render("create.json", %{item: %Item{} = item}) do
    %{
      message: "Item created!",
      item: item
    }
  end
end
