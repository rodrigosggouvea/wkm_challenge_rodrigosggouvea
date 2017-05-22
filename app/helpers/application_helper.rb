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
end
