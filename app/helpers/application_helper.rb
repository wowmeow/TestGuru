module ApplicationHelper
  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'TestGuru на GitHub', "https://github.com/#{author}/#{repo}", target: '_blank', rel: 'noopener'
  end

  def flash_message(action)
    tag.div(tag.p(flash[action]), class: "flash #{action}") if flash[action]
  end
end
