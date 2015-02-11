defmodule Forge do
  use Blacksmith
  alias ConstableApi.Announcement
  alias ConstableApi.Comment
  alias ConstableApi.User

  @save_one_function &Blacksmith.Config.save/2
  @save_all_function &Blacksmith.Config.save_all/2

  register :announcement,
    __struct__: Announcement,
    title: "Post Title",
    body: "Post Body"

  register :comment,
    __struct__: Comment,
    body: "Post Body"

  register :user,
    __struct__: User,
    email: Sequence.next(:email, &"test#{&1}@thoughtbot.com")
end
