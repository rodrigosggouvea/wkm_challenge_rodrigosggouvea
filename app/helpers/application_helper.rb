# frozen_string_literal: true

module ApplicationHelper
  def flash_class(level)
    case level
    when 'notice' then 'light-blue'
    when 'success' then 'green'
    when 'error' then 'red'
    when 'alert' then 'red'
    end
  end

  def paginate_entries(collection)
    if collection.size > 0
      content_tag(:div, class: "row") do
        content_tag(:div, class: "col s12 m6 l6") do
          page_entries_info(collection)
        end + \

        content_tag(:div, class: "col s12 m6 l6") do
          content_tag(:div, class: "pull-right") do
            paginate(collection)
          end
        end
      end
    end
  end
end
