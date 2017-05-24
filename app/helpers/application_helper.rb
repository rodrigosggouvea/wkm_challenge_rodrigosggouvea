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

  def search_form(search_fields)
    content_tag(:div, class: "row") do
      search_form_for @q do |f|
        content_tag(:div, class: "col s12 m10 l10") do
          f.search_field search_fields, { placeholder: t('search') }
        end + \
        content_tag(:div, class: "col s6 m1 l1") do
          select_tag :per, options_for_select([10, 20, 50, 100], params[:per].present? ? params[:per] : 20)
        end + \
        content_tag(:div, class: "col s6 m1 l1") do
          button_tag mi.search, class: "waves-effect waves-light btn right"
        end
      end
    end
  end
end
