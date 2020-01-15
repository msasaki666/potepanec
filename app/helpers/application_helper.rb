module ApplicationHelper
  def full_title(page_title = '') # rubocop:disable Style/OptArgParameters
    base_title = "BIGBAG Store"
    if page_title.blank?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
end
