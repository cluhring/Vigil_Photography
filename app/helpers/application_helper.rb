module ApplicationHelper

  def title_helper(page_title = '')
    base_title = "Vigil Photography"
    if page_title.empty?
      base_title
    else
      base_title + " | " + page_title
    end
  end

  # def random_8
  #   ('a'..'z').to_a.shuffle[0..7].join
  # end

end
