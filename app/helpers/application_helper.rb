module ApplicationHelper

	def full_title page_title = ""
    title = "Ruby on Rails Tutorial Sample App"
    base_title = page_title.empty? ? base_title : page_title + " | " + base_title
  end
end
