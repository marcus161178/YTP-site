module ApplicationHelper
  def title
    if content_for?(:title)
        content_for(:title)
      else
        "Wedding Photographer in Trinidad and Tobago"
      end
  end
end
