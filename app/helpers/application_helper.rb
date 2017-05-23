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
        content_tag(:div, class: "col s12 m12 l12") do
          content_tag(:div, class: "right") do
            paginate(collection)
          end
        end
      end
    end
  end

  def button_to_new(path_to_new)
    content_tag(:div, class: "row") do
      content_tag(:div, class: "col s12 m12 l12") do
        link_to t('new'), path_to_new, class: 'waves-effect waves-light btn right green'
      end
    end
  end

  def button_to_delete_selected
    content_tag(:div, class: "row") do
      content_tag(:div, class: "col s12 m12 l12") do
        submit_tag t('delete'), class: 'waves-effect waves-light red btn right'
      end
    end
  end
end
