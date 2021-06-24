module GistsHelper
  def link_to_gist(url)
    link_to url.split('/').last, url, target: '_blank', rel: 'noopener'
  end
end
