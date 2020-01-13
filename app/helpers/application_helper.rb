module ApplicationHelper
  # rubocop:disable all
  def full_title(page_title = '')
    base_title = "BIGBAG Store"
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  # rubocop:enable all
end
