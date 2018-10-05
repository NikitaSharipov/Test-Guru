module ApplicationHelper

  def current_year
    Time.current.year
  end

  def github_link (author, repo)
    return "https://github.com/#{author}/#{repo}"
  end

end
