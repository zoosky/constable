defmodule ConstableWeb.UserViewsTheirStuff do
  use ConstableWeb.AcceptanceCase

  test "users can see announcements they've authored or commented on", %{session: session} do
    user = insert(:user)
    other_user = insert(:user)
    announcement = insert(:announcement, user: user)
    another_users_announcement = insert(:announcement, user; other_user)

    session
    |> visit(announcement_path(Endpoint, :index, as: user.id))
    |> click_my_stuff

    assert shows?(session, announcement)
    refute shows?(session, announcement)
  end

  defp click_my_stuff(session) do
    session
    |> click(css("[data-role=my-stuff]"))
  end

  defp shows?(session, announcement) do
    session
    |> find(css("[data-role=title"))
    |> has_text?(announcement.title)
  end
end
