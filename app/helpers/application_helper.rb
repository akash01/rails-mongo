module ApplicationHelper

  #returns the full title on a per-page basis
  def full_title(page_title)
    base_title = "Rails and MongoDb"
    if page_title.blank?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
  end

end
